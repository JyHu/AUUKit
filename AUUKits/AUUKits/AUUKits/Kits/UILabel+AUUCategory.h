//
//  UILabel+AUUCategory.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AUUCategory)

#warning - 
@property (assign, nonatomic) BOOL autoFit;
@property (assign, nonatomic) CGFloat autoFitWidth;

/**
 *  @author JyHu, 15-11-16 16:27:31
 *
 *  只设置字体的大小
 *
 *  @param fontSize 字体的大小
 */
- (void)setFontSize:(CGFloat)fontSize;

/**
 *  @author JyHu, 15-11-16 16:27:58
 *
 *  自适应label的时候，需要调整位置
 *
 *  @param width label的正常时的宽度
 */
- (void)sizeToFitWithWidth:(CGFloat)width;

/**
 *  @author JyHu, 15-11-16 16:11:33
 *
 *  @brief  设置带有删除线的内容
 *
 *  @param text label的内容
 */
- (void)setLineAttributedText:(NSString *)text;

@end
