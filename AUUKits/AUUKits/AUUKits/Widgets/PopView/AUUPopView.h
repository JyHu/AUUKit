//
//  AUUPopView.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    AUUPopViewPositionCenter,
    AUUPopViewPositionTop,
    AUUPopViewPositionBottom,
    AUUPopViewPositionLeft,
    AUUPopViewPositionRight,
} AUUPopViewPosition;

@interface AUUPopView : UIView

- (id)initWithWidget:(id)widget position:(AUUPopViewPosition)position;

- (void)show;

- (void)hide;

- (void)hideWithDuration:(NSTimeInterval)timeInterval;

@property (assign, nonatomic) BOOL canAutoHide;

@property (retain, nonatomic) UIColor *shadowColor;

@property (assign, nonatomic) NSTimeInterval duration;

@property (assign, nonatomic) AUUPopViewPosition position;

- (void)hideKeyBoard;


@end
