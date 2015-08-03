//
//  AUUView.m
//  AUUKit
//
//  Created by 胡金友. on 15/5/26.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUView.h"
#import <objc/runtime.h>
#import "AUUNumber.h"

static void * pDurationWhenFrameChangedKey      = (void *)@"pDurationWhenFrameChangedKey";
static void * pNeedAnimationWhenFrameChangedKey = (void *)@"pNeedAnimationWhenFrameChangedKey";
CGFloat const defaultViewAnimationDuration = 0.35;

@implementation UIView(AUUView)

+ (instancetype)instance
{
    return [[[self class] alloc] init];
}

+ (instancetype)instanceWithFrame:(CGRect)frame
{
    return [[[self class] alloc] initWithFrame:frame];
}

- (id)initialization
{
    return [self initWithDuration:defaultViewAnimationDuration];
}

- (id)initializationWithFrame:(CGRect)frame
{
    return [self initWithDuration:defaultViewAnimationDuration frame:frame];
}

- (id)initWithDuration:(NSTimeInterval)duration
{
    self = [[[self class] alloc] init];
    
    if (self)
    {
        self.needAnimationWhenFrameChange = (duration > 0);
        self.animationDurationWhenFrameChanged = (duration <= 0 ? 0 : duration);
    }
    
    return self;
}

- (id)initWithDuration:(NSTimeInterval)duration frame:(CGRect)frame
{
    self = [self initWithDuration:duration];
    
    if (self)
    {
        self.frame = frame;
    }
    
    return self;
}

- (void)setAnimationDurationWhenFrameChanged:(NSTimeInterval)animationDurationWhenFrameChanged
{
    NSTimeInterval duration = animationDurationWhenFrameChanged >= 0 ? animationDurationWhenFrameChanged : 0;
    
    self.needAnimationWhenFrameChange = duration > 0;
    
    objc_setAssociatedObject(self,
                             pDurationWhenFrameChangedKey,
                             @(duration),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)animationDurationWhenFrameChanged
{
    return [objc_getAssociatedObject(self, pDurationWhenFrameChangedKey) floatValue];
}

- (void)setNeedAnimationWhenFrameChange:(BOOL)needAnimationWhenFrameChange
{
    objc_setAssociatedObject(self,
                             pNeedAnimationWhenFrameChangedKey,
                             @(needAnimationWhenFrameChange),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)needAnimationWhenFrameChange
{
    return [objc_getAssociatedObject(self, pNeedAnimationWhenFrameChangedKey) boolValue];
}

#pragma mark - Frame 操作

- (void)setWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    [self resetFrame:rect];
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    [self resetFrame:rect];
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setXOrigin:(CGFloat)xOrigin
{
    CGRect rect = self.frame;
    rect.origin.x = xOrigin;
    [self resetFrame:rect];
}

- (CGFloat)xOrigin
{
    return self.frame.origin.x;
}

- (void)setYOrigin:(CGFloat)yOrigin
{
    CGRect rect = self.frame;
    rect.origin.y = yOrigin;
    [self resetFrame:rect];
}

- (CGFloat)yOrigin
{
    return self.frame.origin.y;
}

- (CGFloat)right
{
    return self.frame.size.width + self.frame.origin.x;
}

- (CGFloat)bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect rect = self.frame;
    rect.size = size;
    [self resetFrame:rect];
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect rect = self.frame;
    rect.origin = origin;
    [self resetFrame:rect];
}

- (CGRect)animationRect
{
    return self.frame;
}

- (void)setAnimationRect:(CGRect)animationRect
{
    [self resetFrame:animationRect];
}

- (void)setIncreaseHeight:(CGFloat)increaseHeight
{
    CGRect rect = self.frame;
    rect.size.height += increaseHeight;
    [self resetFrame:rect];
}

- (void)setIncreaseWidth:(CGFloat)increaseWidth
{
    CGRect rect = self.frame;
    rect.size.width += increaseWidth;
    [self resetFrame:rect];
}

- (void)setIncreaseSize:(CGSize)increaseSize
{
    CGRect rect = self.frame;
    rect.size.height += increaseSize.height;
    rect.size.width += increaseSize.width;
    [self resetFrame:rect];
}

- (void)setIncreaseXOrigin:(CGFloat)increaseXOrigin
{
    CGRect rect = self.frame;
    rect.origin.x = increaseXOrigin;
    [self resetFrame:rect];
}

- (void)setIncreaseYOrigin:(CGFloat)increaseYOrigin
{
    CGRect rect = self.frame;
    rect.origin.y += increaseYOrigin;
    [self resetFrame:rect];
}

- (void)moveToPoint:(CGPoint)point
{
    CGRect rect = self.frame;
    rect.origin = point;
    [self resetFrame:rect];
}

- (void)moveWithDistance:(CGSize)distance
{
    CGRect rect = self.frame;
    rect.size.height += distance.height;
    rect.size.width += distance.width;
    [self resetFrame:rect];
}

- (void)alignCenterWithYOrigin:(CGFloat)yOrigin
{
    CGRect rect = self.frame;
    rect.origin.y = yOrigin;
    rect.origin.x = (kScreenWidth - rect.size.width) / 2.0;
    [self resetFrame:rect];
}

#pragma mark - help methods

- (void)resetFrame:(CGRect)rect
{
    if (self.needAnimationWhenFrameChange)
    {
        [UIView animateWithDuration:self.animationDurationWhenFrameChanged animations:^{
            self.frame = rect;
        }];
    }
    else
    {
        self.frame = rect;
    }
}

#pragma mark - Layer handles

- (void)addBorderWithColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius
{
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = cornerRadius;
}

- (void)removeAllSubViews
{
    for (UIView *view in self.subviews)
    {
        [view removeFromSuperview];
    }
}

@end
