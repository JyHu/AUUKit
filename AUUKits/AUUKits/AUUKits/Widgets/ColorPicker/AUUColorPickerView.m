//
//  AUUColorPickerView.m
//  AUUKits
//
//  Created by 胡金友 on 11/18/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "AUUColorPickerView.h"
#import "UIView+AUUCategory.h"
#import "UIColor+AUUCategory.h"
#import "UIImage+AUUCategory.h"
#import "AUUColorSlider.h"
#import "UILabel+AUUCategory.h"
#import "AUUColorPickerIndicator.h"

NSString *const colorReelImageName = @"color_wheel";

@interface AUUColorPickerView()

/* 颜色色值的图片 */
@property (retain, nonatomic) UIImageView *colorReelImageView;

/* 图片颜色选择的指示器 */
@property (retain, nonatomic) AUUColorPickerIndicator *colorRellIndicator;

/* 选择的色值到黑色的区间色选择器 */
@property (retain, nonatomic) AUUColorSlider *regionColorView;

/* 颜色的透明度的选择器 */
@property (retain, nonatomic) AUUColorSlider *alphaView;

/* 颜色比对的view */
@property (retain, nonatomic) UIView *colorConstrastView;

/* 实时显示颜色的View */
@property (retain, nonatomic) UIView *realTimeColorView;

/* 是否实时显示背景色的按钮 */
@property (retain, nonatomic) UIButton *needBackgroundRealtimeColorShowButton;

/* 颜色信息的label */
@property (retain, nonatomic) UILabel *colorLabel;

//@property (retain, nonatomic) UIScrollView *containingScrollView;




@property (retain, nonatomic) UIColor *reelSelectedColor;

@property (retain, nonatomic) UIColor *selectedColor;

@property (retain, nonatomic) UIImage *colorReelImage;

@end

@implementation AUUColorPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initilization];
    }
    
    return self;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        
    }
    
    return self;
}

- (void)initilization
{
    self.backgroundColor = RGBA(227, 225, 227, 1);
    self.userInteractionEnabled = YES;
    self.colorReelImage = [UIImage imageNamed:colorReelImageName];
    
    /* 添加容器scrollview */
//    self.containingScrollView = [UIScrollView instanceWithFrame:self.bounds];
//    self.containingScrollView.backgroundColor = [UIColor clearColor];
//    self.containingScrollView.showsVerticalScrollIndicator = NO;
//    self.containingScrollView.showsHorizontalScrollIndicator = NO;
//    [self addSubview:self.containingScrollView];
    
    /* 取色圆盘 */
    self.colorReelImageView = [UIImageView instanceWithFrame:CGRectMake(0, 44,
                                                                        self.width - 88,
                                                                        self.width - 88)];
    self.colorReelImageView.centerX = self.width / 2.0;
    self.colorReelImageView.image = self.colorReelImage;
    self.colorReelImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.colorReelImageView];
    
    self.colorRellIndicator = [AUUColorPickerIndicator instanceWithFrame:CGRectMake(0, 0, 20, 20)];
    [self.colorReelImageView addSubview:self.colorRellIndicator];
    
    /* 从取色的色值到黑色的色值区间view */
    self.regionColorView = [[AUUColorSlider alloc] initWithFrame:CGRectMake(20,
                                                                            self.colorReelImageView.viewMaxY + 20,
                                                                            self.width - 40, 40)
                                                    coverageType:AUUColorCoverageTypeGradient];
    [self.regionColorView updateWithRegionColor:[UIColor redColor]];
    [self addSubview:self.regionColorView];
    
    /* alpha区间view */
    self.alphaView = [[AUUColorSlider alloc] initWithFrame:self.regionColorView.frame
                                              coverageType:AUUColorCoverageTypeRegion];
    self.alphaView.yOrigin = self.regionColorView.viewMaxY + 20;
    [self.alphaView updateWithAlphaColor:[UIColor redColor]];
    [self addSubview:self.alphaView];
    
    /* 色值对比的容器view */
    self.colorConstrastView = [UIView instanceWithFrame:CGRectMake(20, 20, 44, 44)];
    self.colorConstrastView.backgroundColor = [UIColor whiteColor];
    self.colorConstrastView.layer.masksToBounds = YES;
    self.colorConstrastView.layer.cornerRadius = 3;
    self.colorConstrastView.layer.borderColor = [UIColor grayColor].CGColor;
    self.colorConstrastView.layer.borderWidth = 1;
    self.colorConstrastView.clipsToBounds = YES;
    [self addSubview:self.colorConstrastView];
    
    /* 实时的颜色 */
    self.realTimeColorView = [UIView instanceWithFrame:CGRectMake(self.colorConstrastView.width / 2.0, 0,
                                                                  self.colorConstrastView.width / 2.0,
                                                                  self.colorConstrastView.height)];
    self.realTimeColorView.backgroundColor = [UIColor blueColor];
    [self.colorConstrastView addSubview:self.realTimeColorView];
    
    self.colorLabel = [UILabel instanceWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.colorLabel setFontSize:8.0];
    self.colorLabel.textColor = [UIColor blackColor];
    self.colorLabel.textAlignment = NSTextAlignmentRight;
    self.colorLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.colorLabel.numberOfLines = 0;
    [self addSubview:self.colorLabel];
    
    [self.regionColorView colorSelectedCompletion:^(UIColor *regionColor) {
        
        [self.alphaView updateWithAlphaColor:regionColor];
    }];
    
    [self.alphaView colorSelectedCompletion:^(UIColor *alphaColor) {
        
        self.realTimeColorView.backgroundColor = alphaColor;
        self.selectedColor = alphaColor;
        [self updateLabelInfo];
    }];
    
    [self touchAction:CGPointMake(5, self.colorReelImageView.height / 2.0)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchAction:[touches.anyObject locationInView:self.colorReelImageView]];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchAction:[touches.anyObject locationInView:self.colorReelImageView]];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchAction:[touches.anyObject locationInView:self.colorReelImageView]];
}

- (void)touchAction:(CGPoint)pt
{
    if (distanceBetween(pt, CGPointMake(self.colorReelImageView.width / 2.0,
                                        self.colorReelImageView.width / 2.0)) <= self.colorReelImageView.width / 2.0)
    {
        self.reelSelectedColor = [self.colorReelImage colorAtPixel:pt];
        
        self.realTimeColorView.backgroundColor = self.reelSelectedColor;
        
        [self updateWithReelColor];
        
        self.colorRellIndicator.center = pt;
    }
}

- (void)updateWithReelColor
{
    [self.regionColorView updateWithRegionColor:self.reelSelectedColor];
    [self.colorRellIndicator updateIndicatorColor:[self.reelSelectedColor reverse]];
}

- (void)updateLabelInfo
{
    RGBA c = [self.selectedColor rgba];
    self.colorLabel.text = [NSString stringWithFormat:@"(%.2f,%.2f,%.2f, %.2f) - RGBA", c.R, c.G, c.B, c.A];
    [self addSubview:self.colorLabel];
    [self.colorLabel sizeToFitWithWidth:200];
    self.colorLabel.xOrigin = self.width - self.colorLabel.width - 10;
    self.colorLabel.yOrigin = 20;
}

@end
