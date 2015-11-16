//
//  UIColor+AUUCategory.m
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "UIColor+AUUCategory.h"

@implementation UIColor (AUUCategory)

+ (UIColor *)randomColor
{
    return RGBA(arc4random()%255, arc4random()%255, arc4random()%255, 1);
}

+ (UIColor *)colorWithHex:(unsigned long)hex
{
    return RGBA((float)((hex & 0xFF0000) >> 16),
                (float)((hex & 0xFF00) >> 8),
                (float)(hex & 0xFF), 1);
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    NSString *redStr = [hexString substringWithRange:NSMakeRange(0, 2)];
    NSScanner *redScanner = [NSScanner scannerWithString:redStr];
    unsigned int redIntValue;
    [redScanner scanHexInt:&redIntValue];
    
    NSString *greenStr = [hexString substringWithRange:NSMakeRange(2, 2)];
    NSScanner *greenScanner = [NSScanner scannerWithString:greenStr];
    unsigned int greenIntValue;
    [greenScanner scanHexInt:&greenIntValue];
    
    NSString *blueStr = [hexString substringWithRange:NSMakeRange(4, 2)];
    NSScanner *blueScanner = [NSScanner scannerWithString:blueStr];
    unsigned int blueIntValue;
    [blueScanner scanHexInt:&blueIntValue];
    
    return [UIColor colorWithRed:redIntValue / 255.0 green:greenIntValue / 255.0 blue:blueIntValue / 255.0 alpha:1];
}

- (RGBA)rgba
{
    RGBA newC;
    
    CGColorRef color = self.CGColor;
    size_t numberComponents = CGColorGetNumberOfComponents(color);
    
    if (numberComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(color);
        newC.R = components[0] * 255.0;
        newC.G = components[1] * 255.0;
        newC.B = components[2] * 255.0;
        newC.A = components[3];
    }
    
    return newC;
}

@end
