//
//  UIColor+AUUCategory.m
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "UIColor+AUUCategory.h"
#import "AUUDebugs.h"

RGBA AUURGBAMake(CGFloat R, CGFloat G, CGFloat B, CGFloat A)
{
    RGBA rgba;
    
    rgba.R = R;
    rgba.G = G;
    rgba.B = B;
    rgba.A = A;
    
    return rgba;
}

UIColor *colorWithRGBA(RGBA rgba)
{
    return RGBA(rgba.R, rgba.G, rgba.B, rgba.A);
}

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
    
    CGFloat R;
    CGFloat G;
    CGFloat B;
    CGFloat A;
    
    BOOL successed = [self getRed:&R green:&G blue:&B alpha:&A];
    
    if (successed)
    {
        RGBA newC;
        
        newC.R = R * 255.0;
        newC.G = G * 255.0;
        newC.B = B * 255.0;
        newC.A = A;
        
        return newC;
    }
    
    return AUURGBAMake(0, 0, 0, 0);
}

+ (UIColor *)colorWithRGBA:(RGBA)rgba
{
    return colorWithRGBA(rgba);
}

+ (UIColor *)regionColorFrom:(UIColor *)fColor toColor:(UIColor *)tColor atLocation:(CGFloat)location
{
    RGBA f = [fColor rgba];
    RGBA t = [tColor rgba];
    
    CGFloat (^resetValue)(CGFloat bf, CGFloat bt) = ^(CGFloat bf, CGFloat bt){
        
        if (bt > bf) {
            return bf + (bt - bf) * location;
        }
        
        return bf - (bf - bt) * location;
    };
    
    RGBA r = AUURGBAMake(resetValue(f.R, t.R),
                         resetValue(f.G, t.G),
                         resetValue(f.B, t.B),
                         resetValue(f.A, t.A));
    
    return [UIColor colorWithRGBA:r];
}

- (UIColor *)updateRed:(CGFloat)red
{
    AUUAssert(red < 0 || red > 255, @"不是合法的色值范围");
    
    RGBA rgbaColor = [self rgba];
    rgbaColor.R = red;
    
    return colorWithRGBA(rgbaColor);
}

- (UIColor *)updateGreen:(CGFloat)green
{
    AUUAssert(green < 0 || green > 255, @"不是合法的色值范围");
    
    RGBA rgbaColor = [self rgba];
    rgbaColor.G = green;
    
    return colorWithRGBA(rgbaColor);
}

- (UIColor *)updateBlue:(CGFloat)blue
{
    AUUAssert(blue < 0 || blue >  255, @"不是合法的色值范围");
    
    RGBA rgbaColor = [self rgba];
    rgbaColor.B = blue;
    
    return colorWithRGBA(rgbaColor);
}

- (UIColor *)updateAlpha:(CGFloat)alpha
{
    AUUAssert(alpha < 0 || alpha > 1, @"不是合法的色值范围");
    
    RGBA rgbaColor = [self rgba];
    rgbaColor.A = alpha;
    
    return [UIColor colorWithRGBA:rgbaColor];
}

- (UIColor *)reverse
{
    RGBA rgba = [self rgba];
    return [UIColor colorWithRGBA:AUURGBAMake(255.0 - rgba.R,
                                              255.0 - rgba.G,
                                              255.0 - rgba.B,
                                              1)];
}

@end
