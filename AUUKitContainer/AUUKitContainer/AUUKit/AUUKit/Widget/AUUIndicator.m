//
//  AUUIndicator.m
//  AUUKit
//
//  Created by 胡金友 on 15/6/11.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUIndicator.h"
#import "AUUColor.h"

@implementation AUUIndicator
{
    UIView *_shadowView;
    UIActivityIndicatorView *_activityIndicatorView;
    CGFloat _bkWidth;
}

+ (AUUIndicator *)shareIndicator
{
    static AUUIndicator *indicator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        indicator = [[AUUIndicator alloc] init];
    });
    return indicator;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _bkWidth = 120;
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        [self package];
        
        self.alpha = 0;
        
        _duration = 0.35;
    }
    return self;
}

- (void)package
{
    _shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _bkWidth, _bkWidth)];
    _shadowView.center = self.center;
    _shadowView.backgroundColor = RGBA(0, 0, 0, 0.618);
    UIViewAutoresizing autoresizingMask =   UIViewAutoresizingFlexibleTopMargin|
                                            UIViewAutoresizingFlexibleBottomMargin|
                                            UIViewAutoresizingFlexibleLeftMargin|
                                            UIViewAutoresizingFlexibleRightMargin;
    _shadowView.autoresizingMask = autoresizingMask;
    _shadowView.layer.masksToBounds = YES;
    _shadowView.layer.cornerRadius = 7;
    [self addSubview:_shadowView];
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _activityIndicatorView.autoresizingMask = autoresizingMask;
    [self addSubview:_activityIndicatorView];
    _activityIndicatorView.center = _shadowView.center;
    _activityIndicatorView.backgroundColor = [UIColor clearColor];
    [_activityIndicatorView startAnimating];
}

- (void)showIndicator
{
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
    
    [_activityIndicatorView startAnimating];

    [UIView animateWithDuration:_duration animations:^{
        
        self.alpha = 1;
    }];
}

- (void)hideIndicator
{
    [UIView animateWithDuration:_duration animations:^{
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [_activityIndicatorView stopAnimating];
        
        [self removeFromSuperview];
    }];
}

- (void)showAutoHideIndicatorWithDelay:(NSTimeInterval)delay
{
    [self showIndicator];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self hideIndicator];
    });
}

- (void)setIndicatorColor:(UIColor *)indicatorColor
{
    _shadowView.backgroundColor = indicatorColor;
}

- (void)setDuration:(NSTimeInterval)duration
{
    _duration = duration;
}

@end
