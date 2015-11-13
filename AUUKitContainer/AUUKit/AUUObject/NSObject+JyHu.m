//
//  NSObject+JyHu.m
//  AUUKitContainer
//
//  Created by 胡金友 on 11/13/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "NSObject+JyHu.h"
#import <objc/runtime.h>

void methodExchangeImplementations(Class cls, SEL originSelector, SEL swizedSelector)
{
    Method originMethod = class_getInstanceMethod(cls, originSelector);
    Method swizedMethod = class_getInstanceMethod(cls, swizedSelector);
    
    method_exchangeImplementations(swizedMethod, originMethod);
    NSLog(@"exchange  %@", NSStringFromClass(cls));
}

@implementation NSObject (JyHu)

+ (void)methodExchangeImplementationsWithOriginSelector:(SEL)originSelector swizedSelector:(SEL)swizedSelector
{
    methodExchangeImplementations([self class], originSelector, swizedSelector);
}

@end
