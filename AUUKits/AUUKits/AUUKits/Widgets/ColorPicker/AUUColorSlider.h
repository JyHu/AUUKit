//
//  AUUColorSlider.h
//  AUUKits
//
//  Created by 胡金友 on 11/18/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AUUColorCoverageType) {
    AUUColorCoverageTypeRegion,
    AUUColorCoverageTypeGradient
};

@interface AUUColorSlider : UIView


@property (assign, nonatomic) AUUColorCoverageType coverageType;


- (id)initWithFrame:(CGRect)frame coverageType:(AUUColorCoverageType)type;




- (void)updateWithFromColor:(UIColor *)fColor endColor:(UIColor *)eColor;

- (void)updateWithAlphaColor:(UIColor *)color;




- (void)updateWithColors:(NSArray *)colors locations:(NSArray *)locations;

- (void)updateWithRegionColor:(UIColor *)color;




- (void)colorSelectedCompletion:(void (^)(UIColor *))completion;



@property (retain, nonatomic, readonly) UIColor *selectedColor;



@end
