//
//  AUUImage.h
//  AUUKit
//
//  Created by 胡金友 on 15/5/19.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @author JyHu, 15-05-19 22:05:17
 *
 *  设置圆角图片的圆角方向
 */
typedef NS_ENUM(NSUInteger, AUUImageRoundedCorner) {
    AUUImageRoundedCornerTopLeft        = 1,        // 上左方向
    AUUImageRoundedCornerTopRight       = 1 << 1,   // 上右方向
    AUUImageRoundedCornerBottomRight    = 1 << 2,   // 下右方向
    AUUImageRoundedCornerBottomLeft     = 1 << 3    // 下左方向
};

@interface UIImage(AUUImage)

/**
 *  @author JyHu, 15-05-19 22:05:14
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
 *  @author JyHu, 15-11-13 15:11:22
 *
 *  @brief  毛玻璃效果
 *
 *  @param radius 模糊的程度
 *
 *  @return 毛玻璃图片
 */
- (UIImage *)blurImageWithRadius:(CGFloat)radius;

/**
 *  @author JyHu, 15-11-13 15:11:13
 *
 *  @brief  一张 1 × 1 大小的纯色图片
 *
 *  @param color 图片颜色
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  @author JyHu, 15-11-13 15:11:12
 *
 *  @brief  做一张size大小的纯色图片
 *
 *  @param color 图片颜色
 *  @param size  图片大小
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size;

@end
