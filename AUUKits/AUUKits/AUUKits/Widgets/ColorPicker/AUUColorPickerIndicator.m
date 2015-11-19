//
//  AUUColorPickerIndicator.m
//  AUUKits
//
//  Created by 胡金友 on 11/18/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "AUUColorPickerIndicator.h"
#import "UIView+AUUCategory.h"
#import "AUUMacros.h"

@interface AUUColorPickerIndicator()

@property (retain, nonatomic) UIColor *p_color;

@end

@implementation AUUColorPickerIndicator

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.p_color = [UIColor blueColor];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)updateIndicatorColor:(UIColor *)color
{
    self.p_color = color;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGFloat r = kMIN(self.width, self.height) / 2.0 - 2;
    CGPoint c = CGPointMake(self.width / 2.0, self.height / 2.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.p_color setFill];
    [self.p_color setStroke];
    
    CGContextMoveToPoint(context, c.x, c.y);
    
    for (NSInteger i = 0; i < 4; i ++)
    {
        CGContextAddArc(context, c.x, c.y, r, M_PI_4 * (2 * i + 1), M_PI_4 * 2 * i, 1);
        CGContextAddLineToPoint(context, c.x, c.y);
    }
    
    CGContextStrokePath(context);
    
}



@end
