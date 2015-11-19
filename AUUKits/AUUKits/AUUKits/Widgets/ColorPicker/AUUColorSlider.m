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
#import "UIImage+AUUCategory.h"

@interface AUUColorSlider()

/* AUUColorCoverageTypeRegion类型的时候，色条的起始颜色 */
@property (retain, nonatomic) UIColor *p_fColor;

/* AUUColorCoverageTypeRegion类型的时候，色条的末尾颜色 */
@property (retain, nonatomic) UIColor *p_eColor;

/* 选择颜色的时候指示当前的位置的指示器 */
@property (retain, nonatomic) AUUColorSliderIndicator *p_indicator;

/* 选择颜色结束的时候回调的block */
@property (copy, nonatomic) void(^p_selectedCompletion)(UIColor *);

/* 当前选择后的颜色 */
@property (retain, nonatomic) UIColor *p_selColor;

/* AUUColorCoverageTypeGradient类型时，渐变色条的layer */
@property (retain, nonatomic) CAGradientLayer *p_gradientLayer;

/* AUUColorCoverageTypeGradient类型时，颜色数组 */
@property (retain, nonatomic) NSArray *p_colors;

/* AUUColorCoverageTypeGradient类型时，位置数组 */
@property (retain, nonatomic) NSArray *p_locations;

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

// 初始化方法
- (id)initWithFrame:(CGRect)frame coverageType:(AUUColorCoverageType)type
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.coverageType = type;
    }
    
    return self;
}

// 色条的绘制类型的set方法
-(void)setCoverageType:(AUUColorCoverageType)coverageType
{
    // 默认的背景色为透明色
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    
    _coverageType = coverageType;
    
    [self initlization];
}

/**
 *  @author JyHu, 15-11-19 15:11:37
 *
 *  @brief  初始化方法
 */
- (void)initlization
{
    if (self.coverageType == AUUColorCoverageTypeRegion)
    {
        self.p_fColor = [UIColor redColor];
        self.p_eColor = [[UIColor redColor] colorWithAlphaComponent:0];
    }
    else if (self.coverageType == AUUColorCoverageTypeGradient)
    {
        self.p_gradientLayer = [CAGradientLayer layer];
        self.p_gradientLayer.frame = self.bounds;
        self.p_gradientLayer.startPoint = CGPointMake(0, 0.5);
        self.p_gradientLayer.endPoint = CGPointMake(1, 0.5);
        [self.layer addSublayer:self.p_gradientLayer];
    }
    else
    {
        
    }
    
    CGFloat x = -10;
    
    // 当绘制渐变色的时候，默认的指示器的位置
    if (self.coverageType == AUUColorCoverageTypeGradient)
    {
        x = self.width / 2.0 - 10;
    }
    
    // 位置指示器的初始化方法
    self.p_indicator = [[AUUColorSliderIndicator alloc] initWithFrame:CGRectMake(x, -5, 20, self.height + 10)];
    self.p_indicator.backgroundColor = [UIColor clearColor];
    [self addSubview:self.p_indicator];
    
}

- (void)drawRect:(CGRect)rect
{
    // 只有当绘制起始、末尾色条的时候才在当前画图
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


// 色条颜色更新的方法
- (void)updateWithFromColor:(UIColor *)fColor endColor:(UIColor *)eColor
{
    self.p_fColor = fColor;
    self.p_eColor = eColor;
    
    [self setNeedsDisplay];
    
    if (self.p_selectedCompletion)
    {
        self.p_selectedCompletion([UIColor regionColorFrom:fColor
                                                 toColor:eColor
                                              atLocation:self.p_indicator.center.x / self.width]);
    }
}

// 色条颜色更新的方法
- (void)updateWithAlphaColor:(UIColor *)color
{
    [self updateWithFromColor:color endColor:[color colorWithAlphaComponent:0.0]];
}

// 色条颜色更新的方法
- (void)updateWithRegionColor:(UIColor *)color
{
    [self updateWithColors:@[[UIColor whiteColor], color, [UIColor blackColor]]
                 locations:@[@0.0, @0.5, @1.0]];
}

// 色条颜色更新的方法
- (void)updateWithColors:(NSArray *)colors locations:(NSArray *)locations
{
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    
    self.p_colors = colors;
    self.p_locations = locations;
    
    NSMutableArray *tArr = [[NSMutableArray alloc] initWithCapacity:colors.count];
    
    for (NSInteger i = 0; i < colors.count; i ++)
    {
        [tArr addObject:(__bridge id)((UIColor *)[colors objectAtIndex:i]).CGColor];
    }
    
    self.p_gradientLayer.colors = tArr;
    self.p_gradientLayer.locations = self.p_locations;
    
    [self colorWithLocation:CGPointMake(self.p_indicator.centerX, 0)];
}











/**
 *  @author JyHu, 15-11-19 15:11:16
 *
 *  @brief  颜色选择block的set方法
 *
 *  @param completion 选择颜色回调的block
 */
- (void)colorSelectedCompletion:(void (^)(UIColor *))completion
{
    self.p_selectedCompletion = completion;
}






#pragma mark - touches 方法

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

/**
 *  @author JyHu, 15-11-19 15:11:29
 *
 *  @brief  根据触屏的位置获取当前位置的颜色
 *
 *  @param touchLocation 触屏的位置
 */
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
    
    // 当前位置距离色条的左边距离与当前色条长度的比例
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
        
        if (scale == [[self.p_locations objectAtIndex:self.p_locations.count - 1] floatValue])
        {
            index = self.p_locations.count - 2;
        }
        else
        {
            for (NSInteger i = 0; i < self.p_locations.count - 1; i ++)
            {
                if (scale >= [[self.p_locations objectAtIndex:i] floatValue] &&
                    scale < [[self.p_locations objectAtIndex:i + 1] floatValue])
                {
                    index = i;
                    break;
                }
            }
        }
        
        CGFloat bs = [[self.p_locations objectAtIndex:index] floatValue];       // 色值区间的最小位置
        CGFloat es = [[self.p_locations objectAtIndex:index + 1] floatValue];   // 色值区间的最大位置
        
        CGFloat scaleWidth = es - bs;
        
        self.p_selColor = [UIColor regionColorFrom:[self.p_colors objectAtIndex:index]
                                           toColor:[self.p_colors objectAtIndex:index + 1]
                                        atLocation:(scale - bs) / scaleWidth];
    }
    
    if (self.p_selectedCompletion)
    {
        self.p_selectedCompletion(self.p_selColor);
    }
    
    // 重新固定当前色条指示器的位置
    self.p_indicator.center = CGPointMake(touchLocation.x, self.height / 2.0);
}

/**
 *  @author JyHu, 15-11-19 15:11:26
 *
 *  @brief  当前色条选择颜色的get方法
 *
 *  @return 选择的颜色
 */
- (UIColor *)selectedColor
{
    return self.p_selColor;
}

@end
