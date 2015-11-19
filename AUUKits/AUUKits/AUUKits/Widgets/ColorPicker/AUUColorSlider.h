//
//  AUUColorSlider.h
//  AUUKits
//
//  Created by 胡金友 on 11/18/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AUUColorCoverageType) {
    AUUColorCoverageTypeRegion,     // 只绘制两端的颜色的色条
    AUUColorCoverageTypeGradient    // 绘制多种颜色的色条
};

@interface AUUColorSlider : UIView

/**
 *  @author JyHu, 15-11-19 14:11:34
 *
 *  @brief  色条绘制的类型
 */
@property (assign, nonatomic) AUUColorCoverageType coverageType;


/**
 *  @author JyHu, 15-11-19 14:11:49
 *
 *  @brief  色条选择器的初始化方法
 *
 *  @param frame 位置 CGRect
 *  @param type  色条绘制的类型
 *
 *  @return self
 */
- (id)initWithFrame:(CGRect)frame coverageType:(AUUColorCoverageType)type;



/**
 *  @author JyHu, 15-11-19 14:11:26
 *
 *  @brief  更新颜色，AUUColorCoverageTypeRegion类型时
 *
 *  @param fColor 开始端的颜色
 *  @param eColor 结束端的颜色
 */
- (void)updateWithFromColor:(UIColor *)fColor endColor:(UIColor *)eColor;

/**
 *  @author JyHu, 15-11-19 14:11:07
 *
 *  @brief  更新颜色，AUUColorCoverageTypeRegion类型，只适用于更新alpha选择器的时候
 *
 *  @param color 当前slider的主色调
 */
- (void)updateWithAlphaColor:(UIColor *)color;



/**
 *  @author JyHu, 15-11-19 14:11:01
 *
 *  @brief  更新颜色，AUUColorCoverageTypeGradient类型时
 *
 *  @param colors    颜色数组
 *  @param locations 位置数组，  @[@0.0, @0.5, @1.0] ，取值范围 0 ~ 1.0
 */
- (void)updateWithColors:(NSArray *)colors locations:(NSArray *)locations;

/**
 *  @author JyHu, 15-11-19 15:11:15
 *
 *  @brief  更新颜色，AUUColorCoverageTypeGradient类型时，只适用于更新 白-color-黑 颜色类型的色条时
 *
 *  @param color 当前slider的主色调
 */
- (void)updateWithRegionColor:(UIColor *)color;



/**
 *  @author JyHu, 15-11-19 15:11:58
 *
 *  @brief  色条选择颜色结束后的回调
 *
 *  @param completion 回调的block
 */
- (void)colorSelectedCompletion:(void (^)(UIColor *))completion;


/**
 *  @author JyHu, 15-11-19 15:11:20
 *
 *  @brief  获取当前的选择的颜色，只有get方法
 */
@property (retain, nonatomic, readonly) UIColor *selectedColor;



@end
