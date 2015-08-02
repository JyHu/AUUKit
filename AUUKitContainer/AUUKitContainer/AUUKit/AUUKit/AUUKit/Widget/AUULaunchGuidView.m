//
//  AUULaunchGuidView.m
//  AUUKit
//
//  Created by 胡金友 on 15/7/25.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUULaunchGuidView.h"
#import "AUUView.h"

@interface AUULaunchGuidView() <UIScrollViewDelegate>

@property (retain, nonatomic) UIScrollView *p_guidScrollView;
@property (retain, nonatomic) UIPageControl *p_pageControll;
@property (copy, nonatomic) AUULaunchGuidCompletionBlock p_completionBlock;
@property (assign, nonatomic) CGFloat p_dismissOffsetX;
@property (retain, nonatomic) NSArray *p_colorsArr;
@property (retain, nonatomic) NSArray *p_imageNamesArr;
@property (assign, nonatomic) NSInteger p_colorIndex;
@property (retain, nonatomic) NSTimer *p_gradientTimer;
@property (retain, nonatomic) CAGradientLayer *p_gradientLayer;

@end

@implementation AUULaunchGuidView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self)
    {
        self.p_dismissOffsetX = 60;
        self.p_colorIndex = 0;
        [self initUI];
    }
    return self;
}

- (id)init
{
    return [self initWithFrame:CGRectZero];
}

- (id)initWithImageNames:(NSArray *)imageNamesArr
{
    self = [self init];
    if (self)
    {
        self.p_imageNamesArr = imageNamesArr;
    }
    return self;
}

- (void)setImageNamesArr:(NSArray *)imageNamesArr
{
    if (imageNamesArr)
    {
        self.p_imageNamesArr = [imageNamesArr copy];
        [self updateUI];
    }
}

- (void)setGradientColorsArr:(NSArray *)gradientColorsArr
{
    if (gradientColorsArr)
    {
        self.p_colorsArr = [gradientColorsArr copy];
        [self updateUI];
    }
}

- (void)initUI
{
    self.p_guidScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.p_guidScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.p_guidScrollView.backgroundColor = [UIColor whiteColor];
    self.p_guidScrollView.showsVerticalScrollIndicator = NO;
    self.p_guidScrollView.showsHorizontalScrollIndicator = NO;
    self.p_guidScrollView.bounces = NO;
    self.p_guidScrollView.pagingEnabled = YES;
    self.p_guidScrollView.delegate = self;
    [self addSubview:self.p_guidScrollView];
}

- (void)updateUI
{
    if (!self.p_guidScrollView)
    {
        return;
    }
    if (!(self.p_colorsArr && self.imageNamesArr))
    {
        return;
    }
    
    [self.p_guidScrollView removeAllSubViews];
    
    self.p_guidScrollView.contentSize = CGSizeMake(kScreenSize.width * self.p_imageNamesArr.count, kScreenSize.height);
    self.p_pageControll.numberOfPages = self.p_imageNamesArr.count;
    self.p_pageControll.currentPage = 0;
    
    for (NSInteger i = 0; i < self.p_imageNamesArr.count; i ++)
    {
        NSString *imageName = self.p_imageNamesArr[i];
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
        CGRect imageFrame = CGRectMake(kScreenSize.width * i, 0, kScreenSize.width, kScreenSize.height);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
        imageView.backgroundColor = [UIColor clearColor];
        [self.p_guidScrollView addSubview:imageView];
        
        if (i == self.p_imageNamesArr.count - 1)
        {
            imageView.userInteractionEnabled = YES;
            
            NSString *titleString = @"马上体验";
            NSDictionary *titleAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:18]};;
            NSMutableAttributedString *titleAttrString = [[NSMutableAttributedString alloc] initWithString:titleString attributes:titleAttributes];
            [titleAttrString addAttribute:NSBaselineOffsetAttributeName value:@(5) range:NSMakeRange(0, titleString.length)];
            
            NSString *arrowString = @" 〉";
            NSDictionary *arrowAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:32]};
            NSMutableAttributedString *arrowAttrString = [[NSMutableAttributedString alloc] initWithString:arrowString attributes:arrowAttributes];
            
            [titleAttrString appendAttributedString:arrowAttrString];
            
            CGSize fullSize = [titleAttrString boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
            
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor clearColor];
            label.attributedText = titleAttrString;
            label.frame = CGRectMake((self.width - fullSize.width) / 2.0 + 10, self.height - 60, fullSize.width, fullSize.height);
            [imageView addSubview:label];
            
            self.p_gradientLayer = [CAGradientLayer layer];
            self.p_gradientLayer.frame = label.frame;
            self.p_gradientLayer.startPoint = CGPointMake(0, 0);
            self.p_gradientLayer.endPoint = CGPointMake(1, 1);
            
            NSMutableArray *tempArr = [NSMutableArray new];
            for (UIColor *color in self.p_colorsArr)
            {
                [tempArr addObject:(id)color.CGColor];
            }
            
            self.p_gradientLayer.colors = tempArr;
            [imageView.layer addSublayer:self.p_gradientLayer];
            self.p_gradientLayer.mask = label.layer;
            label.frame = self.p_gradientLayer.bounds;
            self.p_gradientTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(textColorChange) userInfo:nil repeats:YES];
            
            UIButton *enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
            enterButton.frame = label.frame;
            
            [enterButton setBackgroundColor:[UIColor clearColor]];
            [enterButton addTarget:self action:@selector(skipAndEnter) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:enterButton];
            
            imageView.backgroundColor = [UIColor whiteColor];
        }
        
        BOOL isDirectory = NO;
        if ([[NSFileManager defaultManager] fileExistsAtPath:imagePath isDirectory:&isDirectory]) {
            imageView.image = [UIImage imageWithContentsOfFile:imagePath];
        }
    }
}

- (void)textColorChange
{
    NSMutableArray *gradientColors = [[NSMutableArray alloc] init];
    for (NSInteger i = 0 ; i < self.p_colorsArr.count; i ++)
    {
        [gradientColors addObject:(id)[self colorWithIndex:(i + self.p_colorIndex)].CGColor];
    }
    self.p_gradientLayer.colors = gradientColors;
    self.p_colorIndex ++;
    self.p_colorIndex %= self.p_colorsArr.count;
}

- (UIColor *)colorWithIndex:(NSInteger)index
{
    return self.p_colorsArr[index % self.p_colorsArr.count];
}

#pragma mark - scrollview delegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self updatePageControll];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self updatePageControll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView.contentOffset.x > kScreenWidth * (self.p_imageNamesArr.count - 1) + self.p_dismissOffsetX)
    {
        [self dismiss];
    }
}

- (void)updatePageControll
{
    self.p_guidScrollView.bounces = (self.p_guidScrollView.contentOffset.x >= kScreenWidth);
    NSInteger index = (NSInteger)((self.p_guidScrollView.contentOffset.x + kScreenWidth / 2.0) / kScreenWidth);
    self.p_pageControll.currentPage = index;
    CGFloat scrollOffsetX = self.p_guidScrollView.contentOffset.x;
    if (scrollOffsetX >= kScreenWidth * (self.p_imageNamesArr.count - 2) && scrollOffsetX <= kScreenWidth * (self.p_imageNamesArr.count - 1))
    {
        CGFloat screenOffsetX = scrollOffsetX - kScreenWidth * (self.p_imageNamesArr.count - 2);
        self.p_pageControll.alpha = 1 - scrollOffsetX / kScreenWidth;
        CGRect pageControlFrame = self.p_pageControll.frame;
        pageControlFrame.origin.x = (kScreenWidth - pageControlFrame.size.width) / 2.0 - screenOffsetX;
        self.p_pageControll.frame = pageControlFrame;
    }
}

#pragma mark - button click

- (void)skipAndEnter
{
    [self dismiss];
}

#pragma mark - handle methods

- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    self.alpha = 0;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.alpha = 1;
                     }];
}

- (void)dismiss
{
    self.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.3
                          delay:0.3
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.alpha = 0;
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
        
                         self.p_completionBlock();
                         self.p_completionBlock = nil;
                         [self.p_gradientTimer invalidate];
                         self.p_gradientTimer = nil;
                     }];
}

- (void)guidFinishWithCompletion:(AUULaunchGuidCompletionBlock)completion
{
    if (completion)
    {
        self.p_completionBlock = completion;
    }
}

@end
