//
//  AUUColorSlider.h
//  AUUKits
//
//  Created by 胡金友 on 11/18/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AUUColorSlider : UIView

- (void)updateWithFromColor:(UIColor *)fColor endColor:(UIColor *)eColor;

- (void)colorSelectedCompletion:(void (^)(UIColor *))completion;

@property (retain, nonatomic, readonly) UIColor *selectedColor;

@end
