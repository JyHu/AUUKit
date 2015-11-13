//
//  AUULabel.m
//  AUUKit
//
//  Created by 北京爱康泰科技有限责任公司 on 15/5/28.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUULabel.h"
#import "AUUView.h"

@implementation UILabel(AUULabel)

- (void)setFontSize:(CGFloat)fontSize
{
    self.font = [UIFont systemFontOfSize:fontSize];
}

- (void)sizeToFitWithWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    
    self.width = width;
    [self sizeToFit];
    
    rect.size.height = self.height;
    
    self.frame = rect;
}

- (void)setLineAttributedText:(NSString *)text
{
    NSMutableAttributedString *mutableAttri = [[NSMutableAttributedString alloc] initWithString:text];
    [mutableAttri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(0, text.length)];
    self.attributedText = mutableAttri;
}

@end
