//
//  UITextView+AUUCategory.m
//  AUUKits
//
//  Created by 胡金友 on 11/17/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "UITextView+AUUCategory.h"
#import "NSObject+AUUCategory.h"
#import <objc/runtime.h>

//const char *p_textChangedBlockKey = (void *)@"p_textChangedBlockKey";

@implementation UITextView (AUUCategory)

//- (void)textChanged:(void (^)(NSString *text, UITextField *tf))changedBlock
//{
//    self.delegate = self;
//    
//    [self setAssociatedPropertyWithKey:p_textChangedBlockKey andValue:changedBlock];
//}
//
//- (void)textViewDidChange:(UITextView *)textView
//{
//    void (^changedBlock)(NSString *, UITextView *) = [self getAssociatedPropertyWithKey:p_textChangedBlockKey];
//    
//    changedBlock(textView.text, self);
//}

@end
