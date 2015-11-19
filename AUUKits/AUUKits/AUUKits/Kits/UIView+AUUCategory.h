//
//  UIView+AUUCategory.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kScreenBounds ([UIScreen mainScreen].bounds)    /* 获取屏幕的bounds */
#define kScreenSize (kScreenBounds.size)                /* 获取屏幕的size */
#define kScreenWidth (kScreenSize.width)                /* 获取屏幕的宽度 */
#define kScreenHeight (kScreenSize.height)              /* 获取屏幕的高度 */


#define kRectXOrigin(R) (R.origin.x)        /* 获取 Rect 的 x坐标 */
#define kRectYOrigin(R) (R.origin.y)        /* 获取 Rect 的 y坐标 */
#define kRectWidth(R)   (R.size.width)      /* 获取 Rect 的宽度 */
#define kRectHeight(R)  (R.size.height)     /* 获取 Rect 的高度 */


#define kViewXOrigin(V) (V.frame.origin.x)      /* 获取 View 的x坐标 */
#define kViewYOrigin(V) (V.frame.origin.y)      /* 获取 View 的y坐标 */
#define kViewWidth(V)   (V.frame.size.width)    /* 获取 View 的宽度 */
#define kViewHeight(V)  (V.frame.size.height)   /* 获取 View 的高度 */
#define kViewCenterX(V) (V.center.x)            /* 获取 View中心的x坐标 */
#define kViewCenterY(V) (V.center.y)            /* 获取 View中心的y坐标 */


CGRect resetRectXOrigin(CGRect rect, CGFloat x);        /* 重设Rect的x坐标 */
CGRect resetRectYOrigin(CGRect rect, CGFloat y);        /* 重设Rect的y坐标 */
CGRect resetRectWidth(CGRect rect, CGFloat width);      /* 重设Rect的宽度 */
CGRect resetRectHeight(CGRect rect, CGFloat height);    /* 重设Rect的高度 */
CGRect resetRectOrigin(CGRect rect, CGPoint origin);    /* 重设Rect的point */
CGRect resetRectSize(CGRect rect, CGSize size);         /* 重设Rect的Size */

void resetViewXOrigin(UIView *view, CGFloat x);         /* 重设View的x坐标 */
void resetViewYOrigin(UIView *view, CGFloat y);         /* 重设View的y坐标 */
void resetViewWidth(UIView *view, CGFloat width);       /* 重设View的宽度 */
void resetViewHeight(UIView *view, CGFloat height);     /* 重设View的高度 */
void resetViewOrigin(UIView *view, CGPoint origin);     /* 重设View的point */
void resetViewSize(UIView *view, CGSize size);          /* 重设View的size */
void resetViewCenterX(UIView *view, CGFloat cx);        /* 重设View的中心点x坐标 */
void resetViewCenterY(UIView *view, CGFloat cy);        /* 重设View的中心点y坐标 */

CGFloat distanceBetween(CGPoint pt1, CGPoint pt2);


typedef void (^AUUAnimationHandleBlock) (void);


@interface UIView (AUUCategory)

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

+ (instancetype)instanceWithEdgeInsets:(UIEdgeInsets)edg withSuperView:(UIView *)view;

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
@property (assign, nonatomic, readonly) CGFloat viewMaxX;

/**
 *  @author JyHu, 15-05-22 17:05:33
 *
 *  @brief  获取控件的底边距离父控件顶端的距离
 */
@property (assign, nonatomic, readonly) CGFloat viewMaxY;

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

@property (assign, nonatomic) CGFloat centerX;

@property (assign, nonatomic) CGFloat centerY;

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
- (id)findSubViewWithObjectClass:(Class)cls;

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
- (void)showInWindowWithduration:(NSTimeInterval)duration
                     handleBlock:(AUUAnimationHandleBlock)handle;

/**
 *  @author JyHu, 15-11-16 18:11:57
 *
 *  @brief  UIView动画
 *
 *  @param view     需要加载到的父视图
 *  @param duration 动画时间
 *  @param handle   动画的过程
 */
- (void)showInSuperView:(UIView *)view
           withDuration:(NSTimeInterval)duration
            handleBlock:(AUUAnimationHandleBlock)handle;

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
- (void)hideWithDuration:(NSTimeInterval)duration
             handleBlock:(AUUAnimationHandleBlock)handle;


/**
 *  @author JyHu, 15-11-19 15:11:40
 *
 *  @brief  截取当前View为图片
 *
 *  @return 图片 UIImage
 */
- (UIImage *)interceptingToImage;

@end
