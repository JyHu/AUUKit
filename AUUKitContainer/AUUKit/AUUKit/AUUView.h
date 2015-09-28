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

typedef void (^AUUAnimationHandleBlock) (void);

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

/**
 *  @author JyHu, 15-09-28 14:09:25
 *
 *  @brief  获取当前视图中作为第一响应者的子视图
 *
 *  @return 第一响应者
 *
 *  @since 1.0
 */
- (id)getFirstResponder;

/**
 *  @author JyHu, 15-09-28 14:09:03
 *
 *  @brief  获取当前视图中的某一种视图
 *
 *  @param cls Class
 *
 *  @return 查找的结果
 *
 *  @since 1.0
 */
- (id)findSubViewObj:(Class)cls;

/**
 *  @author JyHu, 15-09-28 14:09:05
 *
 *  @brief  UIView的动画
 *
 *  @param duration 时间
 *  @param handle   动画的内容
 *
 *  @since 1.0
 */
- (void)showInWindowWithduration:(NSTimeInterval)duration handleBlock:(AUUAnimationHandleBlock)handle;

/**
 *  @author JyHu, 15-09-28 14:09:29
 *
 *  @brief  UIView的移除动画
 *
 *  @param duration 时间
 *  @param handle   移除的过程
 *
 *  @since 1.0
 */
- (void)hideWithDuration:(NSTimeInterval)duration handleBlock:(AUUAnimationHandleBlock)handle;

@end
