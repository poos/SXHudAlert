//
//  UIView+HUDAddition.h
//  SXHelper
//
//  Created by Shown on 2017/4/18.
//  Copyright © 2017年 n369. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUDAddition)
//设置加载到window,默认view,只需要设置一次
- (void)setSuperViewWindow:(BOOL)isWindow;
//设置黑色风格,默认白色,只需要设置一次
- (void)setStyleBlack:(BOOL)isBlack;
//会自动隐藏,默认1s
- (void)showAlert:(NSString *)message;
- (void)showAlert:(NSString *)message completion:(void(^)(void))completion;
- (void)showProgerssAlert:(NSString *)message;
- (void)hideAlert;

@end
