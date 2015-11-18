//
//  AUUColorSlider.m
//  AUUKits
//
//  Created by 胡金友 on 11/18/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "AUUColorSlider.h"
#import "UIView+AUUPlot.h"
#import "UIView+AUUCategory.h"
#import "AUUColorSliderIndicator.h"
#import "UIColor+AUUCategory.h"

@interface AUUColorSlider()

@property (retain, nonatomic) UIColor *p_fColor;

@property (retain, nonatomic) UIColor *p_eColor;

@property (retain, nonatomic) AUUColorSliderIndicator *indicator;

@property (copy, nonatomic) void(^selectedCompletion)(UIColor *);

@property (retain, nonatomic) UIColor *p_selColor;

@end

@implementation AUUColorSlider

- (id)init
{
    if (self == [super init]) {
        [self initlization];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initlization];
    }
    
    return self;
}

- (void)initlization
{
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    
    self.p_eColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    self.p_fColor = [UIColor blackColor];
    
    self.indicator = [[AUUColorSliderIndicator alloc] initWithFrame:CGRectMake(-10, -5, 20, self.height + 10)];
    self.indicator.backgroundColor = [UIColor clearColor];
    [self addSubview:self.indicator];
}

- (void)drawRect:(CGRect)rect
{
    [self drawLinerGradientWithPoints:@[[NSValue valueWithCGPoint:CGPointMake(0, 0)],
                                        [NSValue valueWithCGPoint:CGPointMake(self.width, 0)],
                                        [NSValue valueWithCGPoint:CGPointMake(self.width, self.height)],
                                        [NSValue valueWithCGPoint:CGPointMake(0, self.height)]]
                           startColor:self.p_fColor
                             endColor:self.p_eColor
                        startLocation:AUULocationMake(0, 0.5)
                          endLocation:AUULocationMake(1, 0.5)];
}

- (void)updateWithFromColor:(UIColor *)fColor endColor:(UIColor *)eColor
{
    self.p_fColor = fColor;
    self.p_eColor = eColor;
    
    [self setNeedsDisplay];
    
    if (self.selectedCompletion)
    {
        self.selectedCompletion([UIColor regionColorFrom:fColor
                                                 toColor:eColor
                                              atLocation:self.indicator.center.x / self.width]);
    }
}

- (void)colorSelectedCompletion:(void (^)(UIColor *))completion
{
    self.selectedCompletion = completion;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchAction:touches.anyObject];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchAction:touches.anyObject];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchAction:touches.anyObject];
}

- (void)touchAction:(UITouch *)touch
{
    CGPoint touchLocation = [touch locationInView:self];
    
    if (touchLocation.x < 0)
    {
        touchLocation.x = 0;
    }
    
    if (touchLocation.x > self.width)
    {
        touchLocation.x = self.width;
    }
    
    CGFloat scale = touchLocation.x / self.width;
    self.p_selColor = [UIColor regionColorFrom:self.p_fColor
                                        toColor:self.p_eColor
                                     atLocation:scale];

    if (self.selectedCompletion)
    {
        self.selectedCompletion(self.p_selColor);
    }
    
    self.indicator.center = CGPointMake(touchLocation.x, self.height / 2.0);
}

- (UIColor *)selectedColor
{
    return self.p_selColor;
}

@end
