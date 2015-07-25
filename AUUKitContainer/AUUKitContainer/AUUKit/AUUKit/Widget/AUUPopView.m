//
//  AUUPopView.m
//  AUUKit
//
//  Created by 胡金友 on 15/6/11.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUPopView.h"
#import "AUUColor.h"

@interface AUUPopView()

@property (assign, nonatomic) id widget;

@property (assign, nonatomic) BOOL needReset;

@property (retain, nonatomic) UIView *widgetView;

@property (assign, nonatomic) BOOL needResetRemRect;

@property (assign, nonatomic) CGRect remRect;

@property (assign, nonatomic) BOOL hadRegistedKeyboardNotification;

@end

@implementation AUUPopView

- (id)initWithWidget:(id)widget position:(AUUPopViewPosition)position
{
    self = [super init];
    
    if (self)
    {
        self.widget = widget;
        self.position = position;
        self.frame = [UIScreen mainScreen].bounds;
        self.duration = 0.3f;
        self.shadowColor = RGBA(0, 0, 0, 0.2);
        self.canAutoHide = YES;
    }
    
    return self;
}

#pragma mark - 销毁的时候取消通知监听

- (void)dealloc
{
    if (self.hadRegistedKeyboardNotification)
    {
        self.hadRegistedKeyboardNotification = NO;
        
        [[NSNotificationCenter defaultCenter] removeObserver:UIKeyboardWillShowNotification];
        [[NSNotificationCenter defaultCenter] removeObserver:UIKeyboardWillHideNotification];
    }
}

#pragma mark - 弹出视图的显示和隐藏操作

- (void)show
{
    if (_needReset)
    {
        [self package];
    }
    
    self.needResetRemRect = YES;
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    CGRect wframe = _widgetView.frame;
    
    switch (_position)
    {
        case AUUPopViewPositionTop:
            wframe.origin.y = 0;
            break;
            
        case AUUPopViewPositionBottom:
            wframe.origin.y = self.frame.size.height - wframe.size.height;
            break;
            
        case AUUPopViewPositionLeft:
            wframe.origin.x = 0;
            break;
            
        case AUUPopViewPositionRight:
            wframe.origin.x = self.frame.size.width - wframe.size.width;
            break;
            
        case AUUPopViewPositionCenter:
            _widgetView.transform = CGAffineTransformScale(_widgetView.transform, 0.1, 0.1);
            break;
            
        default:
            break;
    }
    
    [UIView animateWithDuration:_duration animations:^{
        
        self.alpha = 1;
        
        if (_position == AUUPopViewPositionCenter)
        {
            _widgetView.transform = CGAffineTransformConcat(_widgetView.transform, CGAffineTransformInvert(_widgetView.transform));
        }
        else
        {
            _widgetView.frame = wframe;
        }
    }];
}

- (void)hide
{
    CGRect wframe = _widgetView.frame;
    
    switch (_position)
    {
        case AUUPopViewPositionTop:
            wframe.origin.y = wframe.size.height * - 1;
            break;
            
        case AUUPopViewPositionBottom:
            wframe.origin.y = self.frame.size.height;
            break;
            
        case AUUPopViewPositionLeft:
            wframe.origin.x = wframe.size.width * -1;
            break;
            
        case AUUPopViewPositionRight:
            wframe.origin.x = self.frame.size.width ;
            break;
            
        default:
            break;
    }
    
    [UIView animateWithDuration:_duration animations:^{
        
        self.alpha = 0;
        
        if (_position == AUUPopViewPositionCenter)
        {
            _widgetView.transform = CGAffineTransformScale(_widgetView.transform, 0.1, 0.1);
        }
        else
        {
            _widgetView.frame = wframe;
        }
    } completion:^(BOOL finished) {
        
        _widgetView.transform = CGAffineTransformConcat(_widgetView.transform, CGAffineTransformInvert(_widgetView.transform));
        
        [self removeFromSuperview];
    }];
}

- (void)hideKeyBoard
{
    [self endEditing:YES];
}

- (void)hideWithDuration:(NSTimeInterval)timeInterval
{
    [self show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self hide];
    });
}

#pragma mark - 设置参数

- (void)setDuration:(NSTimeInterval)duration
{
    _needReset = YES;
    _duration = duration;
}

- (void)setWidget:(id)widget
{
    _needReset = YES;
    _widget = widget;
    
    _widgetView = (UIView *)widget;
}

- (void)setShadowColor:(UIColor *)shadowColor
{
    _shadowColor = shadowColor;
    self.backgroundColor = shadowColor;
}

- (void)setPosition:(AUUPopViewPosition)position
{
    _position = position;
    
    _needReset = YES;
}

#pragma mark - 点击空白处自动隐藏

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint pt = [touch locationInView:self];
    if (!CGRectContainsPoint(_widgetView.frame, pt))
    {
        if (_canAutoHide)
        {
            [self hide];
        }
    }
    else
    {
        [self endEditing:YES];
    }
}

#pragma mark - 布局

- (void)package
{
    self.widgetView.center = self.center;
    
    CGRect frame = self.widgetView.frame;
    
    switch (_position)
    {
        case AUUPopViewPositionTop:
            frame.origin.y = frame.size.height * - 1;
            break;
            
        case AUUPopViewPositionBottom:
            frame.origin.y = self.frame.size.height;
            break;
            
        case AUUPopViewPositionLeft:
            frame.origin.x = frame.size.width * -1;
            break;
            
        case AUUPopViewPositionRight:
            frame.origin.x = self.frame.size.width;
            break;
            
        default:
            break;
    }
    
    _widgetView.frame = frame;
    
    [self addSubview:_widgetView];
    
    self.alpha = 0;
    
    self.needReset = NO;
    
    BOOL needNotify = NO;
    
    for (id view in _widgetView.subviews)
    {
        if ([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]])
        {
            needNotify = YES;
            
            break;
        }
    }
    
    if (needNotify)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
        self.hadRegistedKeyboardNotification = YES;
    }
    else if (self.hadRegistedKeyboardNotification)
    {
        self.hadRegistedKeyboardNotification = NO;
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    }
}

#pragma mark - 键盘的通知

- (void)keyboardShow:(NSNotification *)notify
{
//    if (self.needResetRemRect)
//    {
//        _remRect = _widgetView.frame;
//        self.needResetRemRect = NO;
//    }
//    
//    CGRect wframe = _widgetView.frame;
//    
//    NSDictionary *dict = [notify userInfo];
//    NSValue *value = [dict objectForKey:UIKeyboardFrameEndUserInfoKey];
//    CGRect kRect = [value CGRectValue];
//    NSNumber *dValue = [dict objectForKey:UIKeyboardAnimationDurationUserInfoKey];
//    CGFloat kDuration = [dValue floatValue];
//    
//    wframe.origin.y = self.frame.size.height - kRect.size.height - wframe.size.height;
//    wframe.origin.x = (self.frame.size.width - wframe.size.width) / 2.0;
//    
//    [UIView animateWithDuration:kDuration animations:^{
//        _widgetView.frame = wframe;
//    }];
    
    CGFloat duration = [notify.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGFloat tranformY = [notify.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y - [UIScreen mainScreen].bounds.size.height;
    
    [UIView animateWithDuration:duration animations:^{
        self.widgetView.transform = CGAffineTransformMakeTranslation(0, tranformY);
    }];
}

- (void)keyboardHide:(NSNotification *)notify
{
//    self.needResetRemRect = YES;
//    
//    NSDictionary *dict = [notify userInfo];
//    NSNumber *dValue = [dict objectForKey:UIKeyboardAnimationDurationUserInfoKey];
//    CGFloat kDuration = [dValue floatValue];
//    
//    [UIView animateWithDuration:kDuration animations:^{
//        _widgetView.frame = _remRect;
//    }];
    
    CGFloat duration = [notify.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGFloat tranformY = [notify.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y - [UIScreen mainScreen].bounds.size.height;
    
    [UIView animateWithDuration:duration animations:^{
        self.widgetView.transform = CGAffineTransformMakeTranslation(0, tranformY);
    }];
}

@end
