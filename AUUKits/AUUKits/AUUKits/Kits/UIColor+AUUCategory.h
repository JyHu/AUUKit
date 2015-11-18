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

+ (UIColor *)colorWithRGBA:(RGBA)rgba;

+ (UIColor *)regionColorFrom:(UIColor *)fColor toColor:(UIColor *)tColor atLocation:(CGFloat)location;

- (UIColor *)updateRed:(CGFloat)red;
- (UIColor *)updateGreen:(CGFloat)green;
- (UIColor *)updateBlue:(CGFloat)blue;
- (UIColor *)updateAlpha:(CGFloat)alpha;

- (UIColor *)reverse;

@end
