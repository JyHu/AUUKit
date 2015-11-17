//
//  UITextField+AUUCategory.h
//  AUUKits
//
//  Created by 胡金友 on 11/17/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (AUUCategory) <UITextFieldDelegate>

- (void)textChanged:(void (^)(NSString *text, UITextField *tf))changedBlock;

@end
