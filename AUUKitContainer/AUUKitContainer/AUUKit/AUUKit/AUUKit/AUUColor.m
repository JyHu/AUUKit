//
//  AUUColor.m
//  AUUKit
//
//  Created by 胡金友 on 15/5/19.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUColor.h"

@implementation UIColor(AUUColor)

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
