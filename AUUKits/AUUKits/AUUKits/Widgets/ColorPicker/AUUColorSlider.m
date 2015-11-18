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

@property (retain, nonatomic) CAGradientLayer *gradientLayer;

@property (retain, nonatomic) NSArray *colors;

@property (retain, nonatomic) NSArray *locations;

@end

@implementation AUUColorSlider

- (id)init
{
    if (self == [super init]) {
        
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame coverageType:(AUUColorCoverageType)type
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.coverageType = type;
    }
    
    return self;
}


-(void)setCoverageType:(AUUColorCoverageType)coverageType
{
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    
    _coverageType = coverageType;
    
    [self initlization];
}


- (void)initlization
{
    if (self.coverageType == AUUColorCoverageTypeRegion)
    {
        self.p_fColor = [UIColor redColor];
        self.p_eColor = [[UIColor redColor] colorWithAlphaComponent:0];
    }
    else if (self.coverageType == AUUColorCoverageTypeGradient)
    {
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.frame = self.bounds;
        self.gradientLayer.startPoint = CGPointMake(0, 0.5);
        self.gradientLayer.endPoint = CGPointMake(1, 0.5);
        [self.layer addSublayer:self.gradientLayer];
    }
    else
    {
        
    }
    
    CGFloat x = -10;
    
    if (self.coverageType == AUUColorCoverageTypeGradient)
    {
        x = self.width / 2.0 - 10;
    }
    
    self.indicator = [[AUUColorSliderIndicator alloc] initWithFrame:CGRectMake(x, -5, 20, self.height + 10)];
    self.indicator.backgroundColor = [UIColor clearColor];
    [self addSubview:self.indicator];
    
}

- (void)drawRect:(CGRect)rect
{
    if (self.coverageType == AUUColorCoverageTypeRegion)
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

- (void)updateWithAlphaColor:(UIColor *)color
{
    [self updateWithFromColor:color endColor:[color colorWithAlphaComponent:0.0]];
}

- (void)updateWithRegionColor:(UIColor *)color
{
    [self updateWithColors:@[[UIColor whiteColor], color, [UIColor blackColor]]
                 locations:@[@0.0, @0.5, @1.0]];
}

- (void)updateWithColors:(NSArray *)colors locations:(NSArray *)locations
{
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    
    self.colors = colors;
    self.locations = locations;
    
    NSMutableArray *tArr = [[NSMutableArray alloc] initWithCapacity:colors.count];
    
    for (NSInteger i = 0; i < colors.count; i ++)
    {
        [tArr addObject:(__bridge id)((UIColor *)[colors objectAtIndex:i]).CGColor];
    }
    
    self.gradientLayer.colors = tArr;
    self.gradientLayer.locations = self.locations;
    
    [self colorWithLocation:CGPointMake(self.indicator.centerX, 0)];
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
    
    [self colorWithLocation:touchLocation];
}

- (void)colorWithLocation:(CGPoint)touchLocation
{
    if (touchLocation.x < 0)
    {
        touchLocation.x = 0;
    }
    
    if (touchLocation.x > self.width)
    {
        touchLocation.x = self.width;
    }
    
    CGFloat scale = touchLocation.x / self.width;
    
    if (self.coverageType == AUUColorCoverageTypeRegion)
    {
        self.p_selColor = [UIColor regionColorFrom:self.p_fColor
                                           toColor:self.p_eColor
                                        atLocation:scale];
    }
    else
    {
        NSInteger index = 0;
        
        for (NSInteger i = 0; i < self.locations.count; i ++)
        {
            if (scale - [[self.locations objectAtIndex:i] floatValue] < 0)
            {
                break;
            }
            
            scale -= [[self.locations objectAtIndex:i] floatValue];
            index = i;
        }
        
        self.p_selColor = [UIColor regionColorFrom:[self.colors objectAtIndex:index]
                                           toColor:[self.colors objectAtIndex:index + 1]
                                        atLocation:scale];
    }
    
    
    
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
