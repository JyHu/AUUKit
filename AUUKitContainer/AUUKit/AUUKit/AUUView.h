//
//  AUUView.h
//  AUUKit
//
//  Created by 胡金友. on 15/5/26.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenBounds ([UIScreen mainScreen].bounds)
#define kScreenSize (kScreenBounds.size)
#define kScreenWidth (kScreenSize.width)
#define kScreenHeight (kScreenSize.height)

extern CGFloat const defaultViewAnimationDuration;

@interface UIView(AUUView)

/**
 *  @author JyHu, 15-06-11 17:06:35
 *
 *  初始化方法，取代 alloc-init
 *
 *  @return self
 */
+ (instancetype)instance;

/**
 *  @author JyHu, 15-06-11 17:06:43
 *
 *  初始化方法，取代 alloc-initWithFrame
 *
 *  @param frame CGRect
 *
 *  @return self
 */
+ (instancetype)instanceWithFrame:(CGRect)frame;

/**
 *  @author JyHu, 15-05-30 15:05:45
 *
 *  初始化方法，默认的有0.5s的动画时间
 *
 *  @return self
 */
- (id)initialization;

/**
 *  @author JyHu, 15-05-30 15:05:16
 *
 *  初始化方法，默认的有0.5s的动画
 *
 *  @param frame CGRect
 *
 *  @return self
 */
- (id)initializationWithFrame:(CGRect)frame;

/**
 *  @author JyHu, 15-05-26 00:05:18
 *
 *  初始化方法
 *
 *  @param duration 动画时间，≤0时表示不要动画
 *
 *  @return self
 */
- (id)initWithDuration:(NSTimeInterval)duration;

/**
 *  @author JyHu, 15-05-26 00:05:04
 *
 *  初始化方法
 *
 *  @param duration 动画时间
 *  @param frame    frame
 *
 *  @return self
 */
- (id)initWithDuration:(NSTimeInterval)duration frame:(CGRect)frame;

/**
 *  @author JyHu, 15-05-22 17:05:32
 *
 *  @brief  如果需要过渡动画，设置过渡动画的时间，为0即为不要动画
 */
@property (assign, nonatomic) NSTimeInterval animationDurationWhenFrameChanged;

/**
 *  @author JyHu, 15-08-03 11:08:12
 *
 *  是否需要过渡动画，如果设置的动画时间是个正数，默认的是需要
 *
 *  @since  v 1.0
 */
@property (assign, nonatomic) BOOL needAnimationWhenFrameChange;

/**
 *  @author JyHu, 15-05-22 17:05:58
 *
 *  @brief  获取、设置控件的宽度
 */
@property (assign, nonatomic) CGFloat width;

/**
 *  @author JyHu, 15-05-22 17:05:05
 *
 *  @brief  获取、设置控件的高度
 */
@property (assign, nonatomic) CGFloat height;

/**
 *  @author JyHu, 15-05-22 17:05:13
 *
 *  @brief  获取、设置控件的X坐标
 */
@property (assign, nonatomic) CGFloat xOrigin;

/**
 *  @author JyHu, 15-05-22 17:05:23
 *
 *  @brief  获取、设置控件的Y坐标
 */
@property (assign, nonatomic) CGFloat yOrigin;

/**
 *  @author JyHu, 15-05-22 17:05:31
 *
 *  @brief  获取控件的右边距离父控件左边距的距离
 */
@property (assign, nonatomic, readonly) CGFloat right;

/**
 *  @author JyHu, 15-05-22 17:05:33
 *
 *  @brief  获取控件的底边距离父控件顶端的距离
 */
@property (assign, nonatomic, readonly) CGFloat bottom;

/**
 *  @author JyHu, 15-05-25 23:05:04
 *
 *  获取、设置控件的size
 */
@property (assign, nonatomic) CGSize size;

/**
 *  @author JyHu, 15-05-25 23:05:12
 *
 *  获取、设置控件的point
 */
@property (assign, nonatomic) CGPoint origin;

/**
 *  @author JyHu, 15-05-25 23:05:27
 *
 *  获取、设置控件的frame
 */
@property (assign, nonatomic) CGRect animationRect;

/**
 *  @author JyHu, 15-05-22 17:05:57
 *
 *  @brief  增加控件的高度
 *
 *  @param increaseHeight 增加的高度
 */
- (void)setIncreaseHeight:(CGFloat)increaseHeight;

/**
 *  @author JyHu, 15-05-22 17:05:17
 *
 *  @brief  增加控件的宽度
 *
 *  @param increaseWidth 增加的宽度
 */
- (void)setIncreaseWidth:(CGFloat)increaseWidth;

/**
 *  @author JyHu, 15-05-22 17:05:26
 *
 *  @brief  增加控件的x坐标
 *
 *  @param increaseXOrigin 增加的x坐标距离
 */
- (void)setIncreaseXOrigin:(CGFloat)increaseXOrigin;

/**
 *  @author JyHu, 15-05-22 17:05:18
 *
 *  @brief  增加控件的y坐标
 *
 *  @param increaseYOrigin 增加的y坐标距离
 */
- (void)setIncreaseYOrigin:(CGFloat)increaseYOrigin;

/**
 *  @author JyHu, 15-05-26 00:05:45
 *
 *  增加控件的size
 *
 *  @param increaseSize 增加的size
 */
- (void)setIncreaseSize:(CGSize)increaseSize;

/**
 *  @author JyHu, 15-05-22 17:05:36
 *
 *  @brief  位移到指定的坐标
 *
 *  @param point 位移后的坐标
 */
- (void)moveToPoint:(CGPoint)point;

/**
 *  @author JyHu, 15-05-22 17:05:58
 *
 *  @brief  按位移距离来移动控件
 *
 *  @param distance 位移距离
 */
- (void)moveWithDistance:(CGSize)distance;

/**
 *  @author JyHu, 15-05-22 17:05:45
 *
 *  @brief  屏幕居中并设置y轴位置
 *
 *  @param yOrigin y轴位置
 */
- (void)alignCenterWithYOrigin:(CGFloat)yOrigin;

/**
 *  @author JyHu, 15-05-22 17:05:11
 *
 *  @brief  给控件增加外围线框
 *
 *  @param borderColor  线框颜色
 *  @param borderWidth  线框线条宽度
 *  @param cornerRadius 圆角弧度
 */
- (void)addBorderWithColor:(UIColor *)borderColor
               borderWidth:(CGFloat)borderWidth
              cornerRadius:(CGFloat)cornerRadius;

/**
 *  @author JyHu, 15-08-03 11:08:19
 *
 *  移除所有的子视图
 *
 *  @since  v 1.0
 */
- (void)removeAllSubViews;

@end
