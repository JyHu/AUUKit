//
//  NSObject+JyHu.h
//  AUUKitContainer
//
//  Created by 胡金友 on 11/13/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

void methodExchangeImplementations(Class cls, SEL originSelector, SEL swizedSelector);

@interface NSObject (JyHu)

+ (void)methodExchangeImplementationsWithOriginSelector:(SEL)originSelector
                                         swizedSelector:(SEL)swizedSelector;

@end
