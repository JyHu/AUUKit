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

NSString *const colorReelImageName = @"color_wheel";

@interface AUUColorPickerView()

@property (retain, nonatomic) UIImageView *colorReelImageView;

@property (retain, nonatomic) UIImageView *colorRellIndicator;

@property (retain, nonatomic) AUUColorSlider *regionColorView;

@property (retain, nonatomic) AUUColorSlider *alphaView;

@property (retain, nonatomic) UIView *colorConstrastView;

@property (retain, nonatomic) UIView *realTimeColorView;

@property (retain, nonatomic) UIButton *needBackgroundRealtimeColorShowButton;

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
    
    /* 从取色的色值到黑色的色值区间view */
    self.regionColorView = [AUUColorSlider instanceWithFrame:CGRectMake(20,
                                                                        self.colorReelImageView.viewMaxY + 20,
                                                                        self.width - 40, 40)];
    [self.regionColorView updateWithFromColor:[UIColor redColor] endColor:[UIColor blackColor]];
    [self addSubview:self.regionColorView];
    
    /* alpha区间view */
    self.alphaView = [AUUColorSlider instanceWithFrame:CGRectMake(self.regionColorView.xOrigin,
                                                                  self.regionColorView.viewMaxY + 20,
                                                                  self.regionColorView.width,
                                                                  self.regionColorView.height)];
    [self.alphaView updateWithFromColor:[UIColor redColor] endColor:[[UIColor redColor] colorWithAlphaComponent:0.0]];
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
    [self.colorLabel setFontSize:12.0];
    self.colorLabel.textColor = [UIColor blackColor];
    self.colorLabel.textAlignment = NSTextAlignmentRight;
    self.colorLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.colorLabel.numberOfLines = 0;
    [self addSubview:self.colorLabel];
    
    [self.regionColorView colorSelectedCompletion:^(UIColor *regionColor) {
        
        [self.alphaView updateWithFromColor:regionColor endColor:[regionColor colorWithAlphaComponent:0.0]];
    }];
    
    [self.alphaView colorSelectedCompletion:^(UIColor *alphaColor) {
        
        self.realTimeColorView.backgroundColor = alphaColor;
        self.selectedColor = alphaColor;
        [self updateLabelInfo];
    }];
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
    CGPoint pt = [touch locationInView:self.colorReelImageView];
    
    if (distanceBetween(pt, CGPointMake(self.colorReelImageView.width / 2.0,
                                        self.colorReelImageView.width / 2.0)) <= self.colorReelImageView.width / 2.0)
    {
        self.reelSelectedColor = [self.colorReelImage colorAtPixel:pt];
        
        self.realTimeColorView.backgroundColor = self.reelSelectedColor;
        
        [self updateWithReelColor];
    }
}

- (void)updateWithReelColor
{
    [self.regionColorView updateWithFromColor:self.reelSelectedColor endColor:[UIColor blackColor]];
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
