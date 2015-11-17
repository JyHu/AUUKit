//
//  UILabel+AUUCategory.m
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "UILabel+AUUCategory.h"
#import "UIView+AUUCategory.h"
#import "NSObject+AUUCategory.h"
#import <objc/runtime.h>


static void * p_AutoFitAssociatedKey = (void *)@"p_AutoFitAssociatedKey";
static void * p_AutoFitWidthAssociatedKey = (void *)@"p_AutoFitWidthAssociatedKey";


@implementation UILabel (AUUCategory)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        [self methodExchangeImplementationsWithOriginSelector:@selector(setText:)
//                                               swizedSelector:@selector(_setText:)];
//        [self methodExchangeImplementationsWithOriginSelector:@selector(setAttributedText:)
//                                               swizedSelector:@selector(_setAttributedText:)];
    });
}

//- (void)_setText:(NSString *)text
//{
//    [self _setText:text];
//    
//    if (self.autoFit && self.autoFitWidth > 0)
//    {
//        [self setAutoFitWidth:self.autoFitWidth];
//    }
//}

//- (void)_setAttributedText:(NSAttributedString *)attributedText
//{
//    [self _setAttributedText:attributedText];
//    
//    [self setAutoFitWidth:100];
//    
//    NSLog(@"%d %.2f", self.autoFit, self.autoFitWidth);
//    
//    if (self.autoFit && self.autoFitWidth > 0)
//    {
//        
//    }
//}






-(void)setAutoFit:(BOOL)autoFit
{
    objc_setAssociatedObject(self, p_AutoFitAssociatedKey, @(autoFit), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)autoFit
{
    return [objc_getAssociatedObject(self, p_AutoFitAssociatedKey) boolValue];
}

- (void)setAutoFitWidth:(CGFloat)autoFitWidth
{
    objc_setAssociatedObject(self, p_AutoFitWidthAssociatedKey, @(autoFitWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)autoFitWidth
{
    return [objc_getAssociatedObject(self, p_AutoFitWidthAssociatedKey) floatValue];
}

















- (void)setFontSize:(CGFloat)fontSize
{
    self.font = [UIFont systemFontOfSize:fontSize];
}

- (void)sizeToFitWithWidth:(CGFloat)width
{
    self.width = width;
    [self sizeToFit];
}

- (void)setLineAttributedText:(NSString *)text
{
    NSMutableAttributedString *mutableAttri = [[NSMutableAttributedString alloc] initWithString:text];
    [mutableAttri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(0, text.length)];
    self.attributedText = mutableAttri;
}

@end
