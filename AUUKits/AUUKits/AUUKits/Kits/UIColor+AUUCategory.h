//
//  UIColor+AUUCategory.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA(R,G,B,A) ((UIColor*)[UIColor colorWithRed:(R/255.0) green:(G/255.0) blue:(B/255.0) alpha:(A)])

typedef struct{
    CGFloat R;
    CGFloat G;
    CGFloat B;
    CGFloat A;
} RGBA;

/**
 *  @author JyHu, 15-11-19 15:11:49
 *
 *  @brief  RGBA色值的结构体的构造方法
 */
RGBA AUURGBAMake(CGFloat R, CGFloat G, CGFloat B, CGFloat A);

UIColor *colorWithRGBA(RGBA rgba);

@interface UIColor (AUUCategory)

/**
 *  @author JyHu, 15-11-16 15:11:49
 *
 *  @brief  随机生成颜色
 *
 *  @return UIColor
 */
+ (UIColor *)randomColor;

/**
 *  @author JyHu, 15-11-16 16:11:00
 *
 *  @brief  使用Hex颜色
 *
 *  @param hex 整形的16进制色值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(unsigned long)hex;

/**
 *  @author JyHu, 15-11-16 16:11:06
 *
 *  @brief  使用hex颜色
 *
 *  @param hexString 16进制颜色字符串
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 *  @author JyHu, 15-11-16 16:11:32
 *
 *  @brief  获取颜色的RGBA值
 *
 *  @return RGBA Struct
 */
- (RGBA)rgba;

/**
 *  @author JyHu, 15-11-19 15:11:35
 *
 *  @brief  将RGBA颜色的结构体转换成颜色
 *
 *  @param rgba RGBA Struct
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithRGBA:(RGBA)rgba;

/**
 *  @author JyHu, 15-11-19 15:11:17
 *
 *  @brief  取两个颜色的中间色
 *
 *  @param fColor   开始颜色
 *  @param tColor   结束颜色
 *  @param location 距离开始颜色的比例
 *
 *  @return UIColor
 */
+ (UIColor *)regionColorFrom:(UIColor *)fColor toColor:(UIColor *)tColor atLocation:(CGFloat)location;

/**
 *  @author JyHu, 15-11-19 15:11:15
 *
 *  @brief  更新颜色的R值
 *
 *  @param red 颜色R色值
 *
 *  @return 更新后的颜色
 */
- (UIColor *)updateRed:(CGFloat)red;

/**
 *  @author JyHu, 15-11-19 15:11:37
 *
 *  @brief  更新颜色的G值
 *
 *  @param green 颜色的G色值
 *
 *  @return 更新后的颜色
 */
- (UIColor *)updateGreen:(CGFloat)green;

/**
 *  @author JyHu, 15-11-19 15:11:04
 *
 *  @brief  更新颜色的B值
 *
 *  @param blue 颜色的B色值
 *
 *  @return 更新后的颜色
 */
- (UIColor *)updateBlue:(CGFloat)blue;

/**
 *  @author JyHu, 15-11-19 15:11:29
 *
 *  @brief  更新颜色的alpha值
 *
 *  @param alpha 颜色的alpha值
 *
 *  @return 更新后的颜色
 */
- (UIColor *)updateAlpha:(CGFloat)alpha;

/**
 *  @author JyHu, 15-11-19 15:11:13
 *
 *  @brief  颜色反转，只反转RGB值
 *
 *  @return 反转后的颜色
 */
- (UIColor *)reverse;

@end
