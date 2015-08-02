//
//  AUUColor.h
//  AUUKit
//
//  Created by 胡金友 on 15/5/19.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA(R,G,B,A) ((UIColor*)[UIColor colorWithRed:(R/255.0) green:(G/255.0) blue:(B/255.0) alpha:(A)])

typedef struct{
    CGFloat R;
    CGFloat G;
    CGFloat B;
    CGFloat A;
} RGBA;

@interface UIColor(AUUColor)

/**
 *  @author JyHu, 15-05-19 23:05:56
 *
 *  随机生成颜色
 *
 *  @return UIColor
 */
+ (UIColor *)randomColor;

/**
 *  @author JyHu, 15-05-19 23:05:17
 *
 *  使用Hex颜色
 *
 *  @param hex Hex
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(unsigned long)hex;

/**
 *  @author JyHu, 15-05-26 23:05:44
 *
 *  获取颜色的RGBA值
 *
 *  @return RGBA Struct
 */
- (RGBA)rgba;

@end
