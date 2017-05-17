//
//  UIView+HUDAddition.h
//  SXHelper
//
//  Created by Shown on 2017/4/18.
//  Copyright © 2017年. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 ------------------
 初始化hud
 */
@interface SXHud : NSObject

//设置是否加载到window,默认view,只需要设置一次
+ (void)configSuperViewWindow:(BOOL)isWindow;

//设置黑色风格,默认白色,只需要设置一次
+ (void)configStyleBlack:(BOOL)isBlack;

//设置自动隐藏时间,默认1秒,只需要设置一次
+ (void)configDissmissDelay:(CGFloat)delay;

@end

@interface UIViewController (SXHudHelper)

/*
 ------------------
 会隐藏的提醒
 */
- (void)showAlert:(NSString *)message;
- (void)showAlert:(NSString *)message dissmissed:(void(^)(void))dissmissBlock;

/*
 ------------------
 进度提醒,不自动隐藏
 手动隐藏或者调用其他alert时候隐藏
 ------------------
 */
- (void)showProgerssAlert:(NSString *)message;
- (void)showProgerssAlert:(NSString *)message dissmissed:(void(^)(void))dissmissBlock;

- (void)hideAlert;

@end
