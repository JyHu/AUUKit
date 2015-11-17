//
//  UIImage+AUUCategory.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 *  @author JyHu, 15-11-16 16:11:15
 *
 *  @brief  设置圆角图片的圆角方向
 */
typedef NS_ENUM(NSUInteger, AUUImageRoundedCorner) {
    AUUImageRoundedCornerTopLeft        = 1,        // 上左方向
    AUUImageRoundedCornerTopRight       = 1 << 1,   // 上右方向
    AUUImageRoundedCornerBottomRight    = 1 << 2,   // 下右方向
    AUUImageRoundedCornerBottomLeft     = 1 << 3    // 下左方向
};


@interface UIImage (AUUCategory)

/**
 *  @author JyHu, 15-11-16 16:11:55
 *
 *  设置图片的不同方向的圆角
 *
 *  @param radius     圆角的弧度
 *  @param cornerMask 圆角的方向
 *
 *  @return 圆角图片
 */
- (UIImage *)roundedRectWithRadius:(float)radius cornerMask:(AUUImageRoundedCorner)cornerMask;

/**
 *  @author JyHu, 15-11-16 16:12:53
 *
 *  @brief  毛玻璃效果
 *
 *  @param radius 模糊的程度
 *
 *  @return 毛玻璃图片
 */
- (UIImage *)blurImageWithRadius:(CGFloat)radius;

/**
 *  @author JyHu, 15-11-16 16:13:50
 *
 *  @brief  一张 1 × 1 大小的纯色图片
 *
 *  @param color 图片颜色
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  @author JyHu, 15-11-16 16:15:35
 *
 *  @brief  做一张size大小的纯色图片
 *
 *  @param color 图片颜色
 *  @param size  图片大小
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size;

/**
 *  @author JyHu, 15-11-17 16:11:29
 *
 *  @brief  获取一张图片上的某一点的颜色
 *
 *  @param point 图片上的点
 *
 *  @return 颜色UIColor
 */
- (UIColor *)colorAtPixel:(CGPoint)point;

/**
 *  @author JyHu, 15-11-17 17:11:42
 *
 *  @brief  截取一个范围内的图片
 *
 *  @param rect 要截取的图片范围
 *
 *  @return 截取后的图片
 */
- (UIImage *)croppingInRect:(CGRect)rect;

/**
 *  @author JyHu, 15-11-17 17:11:55
 *
 *  @brief  根据遮盖来截取相应形状的图片
 *
 *  @param maskImage 遮盖的图片
 *
 *  @return 截取到的图片
 */
- (UIImage *)imageWithMaskImage:(UIImage *)maskImage;


- (UIImage *)scaleToSize:(CGSize)size;

@end
