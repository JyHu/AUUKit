//
//  AUUHandleView.h
//  AUUKit
//
//  Created by 胡金友 on 15/5/19.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenBounds ([UIScreen mainScreen].bounds)
#define kScreenSize (kScreenBounds.size)
#define kScreenWidth (kScreenSize.width)
#define kScreenHeight (kScreenSize.height)

@interface AUUHandleView : UIView

@end

@interface UIView(AUUHandleView)

/**
 *  @author JyHu, 15-05-25 23:05:35
 *
 *  粗略的控制所有的View的变换是否需要动画，但是如果每个控件设置了自己的动画属性的话，则以每个控件的属性设置为主
 *
 *  @param duration 动画时间，当动画时间为≤0时，即关闭粗略的动画控制
 */
+ (void)setAllChangesNeedAnimationWithDuration:(NSTimeInterval)duration;

/**
 *  @author JyHu, 15-05-26 00:05:43
 *
 *  关闭对所有View粗略的动画控制
 */
+ (void)setAllChangesNeedAnimationConditionClosed;

/**
 *  @author JyHu, 15-05-26 11:05:35
 *
 *  @brief  初始化方法，类似于原有的 init 方法
 *
 *  @return self
 */
- (id)initialization;

/**
 *  @author JyHu, 15-05-26 11:05:52
 *
 *  @brief  初始化方法，类似于原有的 initWithFrame: 方法
 *
 *  @param frame frame
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
 *  @author JyHu, 15-05-22 17:05:43
 *
 *  @brief  设置是否需要在改变Frame时候的过渡动画
 */
@property (assign, nonatomic) BOOL needAnimationWhenFrameChanged;

/**
 *  @author JyHu, 15-05-22 17:05:32
 *
 *  @brief  如果需要过渡动画，设置过渡动画的时间
 */
@property (assign, nonatomic) NSTimeInterval durationWhenFrameChanged;

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
@property (assign, nonatomic) CGRect rect;

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

@end

