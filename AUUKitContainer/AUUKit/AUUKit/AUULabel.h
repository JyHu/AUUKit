//
//  AUULabel.h
//  AUUKit
//
//  Created by 北京爱康泰科技有限责任公司 on 15/5/28.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel(AUULabel)

/**
 *  @author JyHu, 15-08-08 20:08:22
 *
 *  只设置字体的大小
 *
 *  @param fontSize 字体的大小
 *
 *  @since 1.2
 */
- (void)setFontSize:(CGFloat)fontSize;

/**
 *  @author JyHu, 15-08-08 20:08:49
 *
 *  自适应label的时候，需要调整位置
 *
 *  @param width label的正常时的宽度
 *
 *  @since 1.2
 */
- (void)sizeToFitWithWidth:(CGFloat)width;

- (void)setLineAttributedText:(NSString *)text;

@end
