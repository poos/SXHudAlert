//
//  UIView+HUDAddition.m
//  SXHelper
//
//  Created by Shown on 2017/4/18.
//  Copyright © 2017年. All rights reserved.
//

#import "SXHudAlert.h"
#import "MBProgressHUD.h"

static MBProgressHUD *hud = nil;
static void(^staticDissmissBlock)(void) ;
static BOOL hubStyleBlack = NO;
static BOOL hubSuperViewWindow = NO;
static CGFloat hubDelayTime = 1;

@interface HubDelegate : NSObject <MBProgressHUDDelegate>

@end

@implementation HubDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud {
    staticDissmissBlock();
}

@end

static HubDelegate *hubDelegate = nil;

@implementation SXHud

+ (void)configSuperViewWindow:(BOOL)isWindow {
    hubSuperViewWindow = isWindow;
}

+ (void)configStyleBlack:(BOOL)isBlack {
    hubStyleBlack = isBlack;
}

+ (void)configDissmissDelay:(CGFloat)delay {
    hubDelayTime = delay;
}

@end

@implementation UIViewController (SXHudHelper)

- (void)hideAlert {
    [hud hideAnimated:YES];
    [hud removeFromSuperview];
    hud = nil;
}

- (void)showAlert:(NSString *)message {
    [self showAlert:message dissmissed:nil];
}

- (void)showAlert:(NSString *)message dissmissed:(void(^)(void))dissmissBlock{
    [self showBaseAlert:message isProgressHub:NO dissmissed:dissmissBlock];
}

- (void)showProgerssAlert:(NSString *)message {
    [self showProgerssAlert:message dissmissed:nil];
}

- (void)showProgerssAlert:(NSString *)message dissmissed:(void(^)(void))dissmissBlock{
    [self showBaseAlert:message isProgressHub:YES dissmissed:dissmissBlock];
}


- (void)showBaseAlert:(NSString *)message isProgressHub:(BOOL)isProgressHub dissmissed:(void(^)(void))dissmissBlock{
    
    [self createHudAndIsPlain:!isProgressHub];
    hud.label.text = message;
    
    if (hubSuperViewWindow) {
        [[[UIApplication sharedApplication].delegate window] addSubview:hud];
    } else {
        UIView * view = nil;
        if ([self isKindOfClass:[UIViewController class]]) {
            view = [(UIViewController *)self view];
        } else if ([self isKindOfClass:[UIView class]]) {
            view = (UIView *)self;
        } else {
            return;
        }
        [view addSubview:hud];
    }
    [hud showAnimated:YES];
    
    if (!isProgressHub) {
        [hud hideAnimated:YES afterDelay:hubDelayTime];
    }
    
    if (dissmissBlock) {
        staticDissmissBlock = dissmissBlock;
        if (!hubDelegate) {
            hubDelegate = [[HubDelegate alloc] init];
        }
        hud.delegate = hubDelegate;
    }
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
