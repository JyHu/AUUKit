//
//  UIView+AUUCategory.m
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "UIView+AUUCategory.h"


CGRect resetRectXOrigin(CGRect rect, CGFloat x) {
    rect.origin.x = x;
    return rect;
}

CGRect resetRectYOrigin(CGRect rect, CGFloat y) {
    rect.origin.y = y;
    return rect;
}

CGRect resetRectWidth(CGRect rect, CGFloat width) {
    rect.size.width = width;
    return rect;
}

CGRect resetRectHeight(CGRect rect, CGFloat height) {
    rect.size.height = height;
    return rect;
}

CGRect resetRectOrigin(CGRect rect, CGPoint origin) {
    rect.origin = origin;
    return rect;
}

CGRect resetRectSize(CGRect rect, CGSize size) {
    rect.size = size;
    return rect;
}

void resetViewXOrigin(UIView *view, CGFloat x) {
    view.frame = resetRectXOrigin(view.frame, x);
}

void resetViewYOrigin(UIView *view, CGFloat y) {
    view.frame = resetRectYOrigin(view.frame, y);
}

void resetViewWidth(UIView *view, CGFloat width) {
    view.frame = resetRectWidth(view.frame, width);
}

void resetViewHeight(UIView *view, CGFloat height) {
    view.frame = resetRectHeight(view.frame, height);
}

void resetViewOrigin(UIView *view, CGPoint origin) {
    view.frame = resetRectOrigin(view.frame, origin);
}

void resetViewSize(UIView *view, CGSize size){
    view.frame = resetRectSize(view.frame, size);
}

void resetViewCenterX(UIView *view, CGFloat cx){
    view.center = CGPointMake(cx, view.center.y);
}

void resetViewCenterY(UIView *view, CGFloat cy){
    view.center = CGPointMake(view.center.x, cy);
}

@implementation UIView (AUUCategory)

+ (instancetype)instance
{
    return [[[self class] alloc] init];
}

+ (instancetype)instanceWithFrame:(CGRect)frame
{
    return [[[self class] alloc] initWithFrame:frame];
}

#pragma mark - Frame 操作

- (void)setWidth:(CGFloat)width     { resetViewWidth(self, width); }

- (CGFloat)width    { return kViewWidth(self); }

- (void)setHeight:(CGFloat)height   { resetViewHeight(self, height); }

- (CGFloat)height   { return kViewHeight(self); }

- (void)setXOrigin:(CGFloat)xOrigin { resetViewXOrigin(self, xOrigin); }

- (CGFloat)xOrigin  { return kViewXOrigin(self); }

- (void)setYOrigin:(CGFloat)yOrigin { resetViewYOrigin(self, yOrigin); }

- (CGFloat)yOrigin  { return kViewYOrigin(self); }

- (CGFloat)viewMaxX { return self.width + self.xOrigin; }

- (CGFloat)viewMaxY { return self.height + self.yOrigin; }

- (CGSize)size      { return self.frame.size; }

- (void)setSize:(CGSize)size { resetViewSize(self, size); }

- (CGPoint)origin   { return self.frame.origin; }

- (void)setOrigin:(CGPoint)origin { resetViewOrigin(self, origin); }

- (void)setIncreaseHeight:(CGFloat)increaseHeight
{
    resetViewHeight(self, self.height + increaseHeight);
}

- (void)setIncreaseWidth:(CGFloat)increaseWidth
{
    resetViewWidth(self, self.width + increaseWidth);
}

- (void)setIncreaseSize:(CGSize)increaseSize
{
    self.frame = resetRectWidth(resetRectHeight(self.frame,
                                                increaseSize.height + self.height),
                                increaseSize.width + self.width);
}

- (void)setIncreaseXOrigin:(CGFloat)increaseXOrigin
{
    resetViewXOrigin(self, self.xOrigin + increaseXOrigin);
}

- (void)setIncreaseYOrigin:(CGFloat)increaseYOrigin
{
    resetViewYOrigin(self, self.yOrigin + increaseYOrigin);
}

- (void)moveToPoint:(CGPoint)point
{
    resetViewOrigin(self, point);
}

- (void)moveWithDistance:(CGSize)distance
{
    self.frame = resetRectXOrigin(resetRectYOrigin(self.frame,
                                                   self.yOrigin + distance.height),
                                  self.xOrigin + distance.width);
}

- (void)alignCenterWithYOrigin:(CGFloat)yOrigin
{
    resetViewCenterX(self, (self.superview.width - self.width) / 2.0);
    resetViewCenterY(self, yOrigin);
}

#pragma mark - Layer handles

- (void)addBorderWithColor:(UIColor *)borderColor
               borderWidth:(CGFloat)borderWidth
              cornerRadius:(CGFloat)cornerRadius
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

- (id)findSubViewWithObjectClass:(Class)cls
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
        for (id view in self.subviews)
        {
            if ([view isKindOfClass:cls])
            {
                return view;
            }
            else
            {
                return [view findSubViewWithObjectClass:cls];
            }
        }
    }
    
    return nil;
}

- (void)showInWindowWithduration:(NSTimeInterval)duration
                     handleBlock:(AUUAnimationHandleBlock)handle
{
    [self showInSuperView:[UIApplication sharedApplication].keyWindow
             withDuration:duration
              handleBlock:handle];
}

- (void)showInSuperView:(UIView *)view
           withDuration:(NSTimeInterval)duration
            handleBlock:(AUUAnimationHandleBlock)handle
{
    [view addSubview:self];
    
    [UIView animateWithDuration:duration animations:^{
        handle();
    }];
}

- (void)hideWithDuration:(NSTimeInterval)duration
             handleBlock:(AUUAnimationHandleBlock)handle
{
    [UIView animateWithDuration:duration animations:^{
        handle();
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
