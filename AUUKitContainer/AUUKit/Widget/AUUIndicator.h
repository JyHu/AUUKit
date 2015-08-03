//
//  AUUIndicator.h
//  AUUKit
//
//  Created by 胡金友 on 15/6/11.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AUUIndicator : UIView

/**
 *  @author JyHu, 15-06-12 01:06:01
 *
 *  单利方法
 *
 *  @return self
 */
+ (AUUIndicator *)shareIndicator;

/**
 *  @author JyHu, 15-06-12 01:06:51
 *
 *  显示等待视图
 */
- (void)showIndicator;

/**
 *  @author JyHu, 15-06-12 01:06:44
 *
 *  隐藏等待视图
 */
- (void)hideIndicator;

/**
 *  @author JyHu, 15-06-12 01:06:08
 *
 *  显示一个自动隐藏的等待视图
 *
 *  @param delay 等待视图显示的时间
 */
- (void)showAutoHideIndicatorWithDelay:(NSTimeInterval)delay;

/**
 *  @author JyHu, 15-06-12 01:06:53
 *
 *  设置等待视图的背景颜色
 */
@property (retain, nonatomic) UIColor *indicatorColor;

/**
 *  @author JyHu, 15-06-12 01:06:18
 *
 *  设置动画显示、隐藏时所持续的时间
 */
@property (assign, nonatomic) NSTimeInterval duration;

@end
