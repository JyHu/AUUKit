//
//  AUUView.m
//  AUUKit
//
//  Created by 胡金友. on 15/5/26.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUView.h"
#import "AUUNumber.h"

@implementation UIView(AUUView)

+ (instancetype)instance
{
    return [[[self class] alloc] init];
}

+ (instancetype)instanceWithFrame:(CGRect)frame
{
    return [[[self class] alloc] initWithFrame:frame];
}

#pragma mark - Frame 操作

- (void)setWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setXOrigin:(CGFloat)xOrigin
{
    CGRect rect = self.frame;
    rect.origin.x = xOrigin;
    self.frame = rect;
}

- (CGFloat)xOrigin
{
    return self.frame.origin.x;
}

- (void)setYOrigin:(CGFloat)yOrigin
{
    CGRect rect = self.frame;
    rect.origin.y = yOrigin;
    self.frame = rect;
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
    self.frame = rect;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

- (void)setIncreaseHeight:(CGFloat)increaseHeight
{
    CGRect rect = self.frame;
    rect.size.height += increaseHeight;
    self.frame = rect;
}

- (void)setIncreaseWidth:(CGFloat)increaseWidth
{
    CGRect rect = self.frame;
    rect.size.width += increaseWidth;
    self.frame = rect;
}

- (void)setIncreaseSize:(CGSize)increaseSize
{
    CGRect rect = self.frame;
    rect.size.height += increaseSize.height;
    rect.size.width += increaseSize.width;
    self.frame = rect;
}

- (void)setIncreaseXOrigin:(CGFloat)increaseXOrigin
{
    CGRect rect = self.frame;
    rect.origin.x = increaseXOrigin;
    self.frame = rect;
}

- (void)setIncreaseYOrigin:(CGFloat)increaseYOrigin
{
    CGRect rect = self.frame;
    rect.origin.y += increaseYOrigin;
    self.frame = rect;
}

- (void)moveToPoint:(CGPoint)point
{
    CGRect rect = self.frame;
    rect.origin = point;
    self.frame = rect;
}

- (void)moveWithDistance:(CGSize)distance
{
    CGRect rect = self.frame;
    rect.size.height += distance.height;
    rect.size.width += distance.width;
    self.frame = rect;
}

- (void)alignCenterWithYOrigin:(CGFloat)yOrigin
{
    CGRect rect = self.frame;
    rect.origin.y = yOrigin;
    rect.origin.x = (kScreenWidth - rect.size.width) / 2.0;
    self.frame = rect;
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

- (id)getFirstResponder
{
    if (self.subviews.count == 0)
    {
        if ([self isKindOfClass:[UITextView class]] || [self isKindOfClass:[UITextField class]])
        {
            if ((BOOL)[self isFirstResponder])
            {
                return self;
            }
        }
        
        return nil;
    }
    
    for (id view in self.subviews)
    {
        if ([view isKindOfClass:[UITextField class]] || [view isKindOfClass:[UITextView class]])
        {
            if ((BOOL)[view isFirstResponder])
            {
                return view;
            }
        }
        else if ([[view subviews] count] > 0)
        {
            id v = [view getFirstResponder];
            
            if (v)
            {
                return v;
            }
        }
    }
    
    return nil;
}

- (id)findSubViewObj:(Class)cls
{
    if (self.subviews.count == 0)
    {
        if ([self isKindOfClass:cls])
        {
            return self;
        }
        
        return nil;
    }
    else
    {
        NSLog(@"%@", self.subviews);
        
        for (id view in self.subviews)
        {
            if ([view isKindOfClass:cls])
            {
                return view;
            }
            else
            {
                return [view findSubViewObj:cls];
            }
        }
    }
    
    return nil;
}

- (void)showInWindowWithduration:(NSTimeInterval)duration handleBlock:(AUUAnimationHandleBlock)handle
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:duration animations:^{
        handle();
    }];
}

- (void)hideWithDuration:(NSTimeInterval)duration handleBlock:(AUUAnimationHandleBlock)handle
{
    [UIView animateWithDuration:duration animations:^{
        handle();
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
