//
//  UIView+HUDAddition.h
//  SXHelper
//
//  Created by Shown on 2017/4/18.
//  Copyright © 2017年 n369. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 ------------------
 UIView的分类
 ------------------
 */
@interface UIView (SXHUDAddition)

//设置加载到window,默认view,只需要设置一次
- (void)setSuperViewWindow:(BOOL)isWindow;

//设置黑色风格,默认白色,只需要设置一次
- (void)setStyleBlack:(BOOL)isBlack;


/*
 ------------------
 会隐藏的提醒
 ------------------
 
 会自动隐藏,默认1s
 -showAlert
 
 设置隐藏时间,默认1秒,只需要设置一次
 -setDissmissDelay
 ------------------
 */
- (void)setDissmissDelay:(CGFloat)delay ;
- (void)showAlert:(NSString *)message;
- (void)showAlert:(NSString *)message completion:(void(^)(void))completion;

/*
 ------------------
 不会隐藏的进度提醒
 ------------------
 
 手动隐藏
 -hideAlert
 
 !!!!!注意!!!!!
 调用showAlert会隐藏Progress
 ------------------
 */
- (void)showProgerssAlert:(NSString *)message;
- (void)hideAlert;

@end
