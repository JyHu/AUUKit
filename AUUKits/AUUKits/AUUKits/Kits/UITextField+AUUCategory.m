//
//  UITextField+AUUCategory.m
//  AUUKits
//
//  Created by 胡金友 on 11/17/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "UITextField+AUUCategory.h"
#import "NSObject+AUUCategory.h"
#import <objc/runtime.h>

const char *p_textChangedBlockKey = (void *)@"p_textChangedBlockKey";

@implementation UITextField (AUUCategory)

- (void)textChanged:(void (^)(NSString *, UITextField *))changedBlock
{
    self.delegate = self;
    
    [self setAssociatedPropertyWithKey:p_textChangedBlockKey andValue:changedBlock];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    void (^changedBlock)(NSString *text, UITextField *tf) = [self getAssociatedPropertyWithKey:p_textChangedBlockKey];
    
    if (![string isEqualToString:@""])
    {
        changedBlock([textField.text stringByAppendingString:string], self);
    }
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    void (^changedBlock)(NSString *text, UITextField *tf) = [self getAssociatedPropertyWithKey:p_textChangedBlockKey];
    
    changedBlock(textField.text, self);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self endEditing:YES];
    
    return YES;
}

@end
