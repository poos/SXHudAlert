//
//  UIView+HUDAddition.m
//  SXHelper
//
//  Created by Shown on 2017/4/18.
//  Copyright © 2017年 n369. All rights reserved.
//

#import "SXHudAlert.h"
#import "MBProgressHUD.h"

static MBProgressHUD *hud = nil;
static void(^staticCompletion)(void) ;
static BOOL hubStyleBlack = NO;
static BOOL hubSuperViewWindow = NO;

@interface HubDelegate : NSObject <MBProgressHUDDelegate>

@end

@implementation HubDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud {
    staticCompletion();
}

@end

static HubDelegate *hubDelegate = nil;
@implementation UIView (SXHUDAddition)


- (void)setSuperViewWindow:(BOOL)isWindow {
    hubSuperViewWindow = isWindow;
}

- (void)setStyleBlack:(BOOL)isBlack {
    hubStyleBlack = isBlack;
}

- (void)showAlert:(NSString *)message {
    UIView * view = nil;
    if ([self isKindOfClass:[UIViewController class]]) {
        view = [(UIViewController *)self view];
    } else if ([self isKindOfClass:[UIView class]]) {
        view = (UIView *)self;
    } else {
        return;
    }
    [self createHudAndIsPlain:YES];
    hud.label.text = message;
    if (hubSuperViewWindow) {
        [[[UIApplication sharedApplication].delegate window] addSubview:hud];
    } else {
        [view addSubview:hud];
    }
    [hud showAnimated:YES];
    
    [hud hideAnimated:YES afterDelay:1];
}

- (void)showAlert:(NSString *)message completion:(void(^)(void))completion {
    UIView * view = nil;
    if ([self isKindOfClass:[UIViewController class]]) {
        view = [(UIViewController *)self view];
    } else if ([self isKindOfClass:[UIView class]]) {
        view = (UIView *)self;
    } else {
        return;
    }
    [self createHudAndIsPlain:YES];
    hud.label.text = message;
    if (hubSuperViewWindow) {
        [[[UIApplication sharedApplication].delegate window] addSubview:hud];
    } else {
        [view addSubview:hud];
    }
    [hud showAnimated:YES];
    
    [hud hideAnimated:YES afterDelay:1];
    
    staticCompletion = completion;
    if (!hubDelegate) {
        hubDelegate = [[HubDelegate alloc] init];
    }
    hud.delegate = hubDelegate;
}

- (void)hideAlert {
    [hud hideAnimated:YES];
    [hud removeFromSuperview];
    hud = nil;
}

- (void)showProgerssAlert:(NSString *)message {
    UIView * view = nil;
    if ([self isKindOfClass:[UIViewController class]]) {
        view = [(UIViewController *)self view];
    } else if ([self isKindOfClass:[UIView class]]) {
        view = (UIView *)self;
    } else {
        return;
    }
    [self createHudAndIsPlain:NO];
    if (hubSuperViewWindow) {
        [[[UIApplication sharedApplication].delegate window] addSubview:hud];
    } else {
        [view addSubview:hud];
    }
    hud.label.text = message;
    [hud showAnimated:YES];
}

- (void)createHudAndIsPlain:(BOOL)isPlain {
    if (hud) {
        [self hideAlert];
    }
    hud = [[MBProgressHUD alloc] initWithFrame:[UIScreen mainScreen].bounds];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.minSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3, [UIScreen mainScreen].bounds.size.width/3);
    hud.backgroundView.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:.2];
    hud.bezelView.color = [UIColor whiteColor];
    if (hubStyleBlack) {
        hud.bezelView.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:.8];
        hud.label.textColor = [UIColor whiteColor];
        hud.contentColor = [UIColor whiteColor];
    }
    if (isPlain) {
        hud.minSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/2, 44);
        hud.mode = MBProgressHUDModeText;
    }
}


@end
