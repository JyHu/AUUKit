//
//  AUUColorSliderIndicator.m
//  AUUKits
//
//  Created by 胡金友 on 11/18/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "AUUColorSliderIndicator.h"
#import "UIView+AUUCategory.h"

@interface AUUColorSliderIndicator()

@property (retain, nonatomic) UIColor *p_color;

@end

@implementation AUUColorSliderIndicator

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.p_color = [UIColor blueColor];
    }
    
    return self;
}

- (void)updateIndicatorColor:(UIColor *)color
{
    self.p_color = color;
    
    [self setNeedsDisplay];
    
    self.layer.masksToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = 1.0f;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.p_color setFill];
    [self.p_color setStroke];
    
    CGContextMoveToPoint(context, self.width / 2.0, self.width / 2.0);
    CGContextAddArc(context, 0, self.width / 2.0, self.width / 2.0, 0, M_PI_2 * 3, 1);
    CGContextAddLineToPoint(context, self.width, 0);
    CGContextAddArc(context, self.width, self.width / 2.0, self.width / 2.0, M_PI_2 * 3, M_PI, 1);
    CGContextAddLineToPoint(context, self.width / 2.0, self.height - self.width / 2.0);
    CGContextAddArc(context, self.width, self.height - self.width / 2.0, self.width / 2.0, M_PI, M_PI_2, 1);
    CGContextAddLineToPoint(context, 0, self.height);
    CGContextAddArc(context, 0, self.height - self.width / 2.0, self.width / 2.0, M_PI_2 * 3, 0, 1);
    
    CGContextSetLineWidth(context, 1);
    
    CGContextFillPath(context);
    
    
    CGContextRef lcontext = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(lcontext, self.width / 2.0, 0);
    CGContextAddLineToPoint(lcontext, self.width / 2.0, self.height);
    CGContextSetLineWidth(lcontext, 1);
    CGContextStrokePath(lcontext);
}



@end
