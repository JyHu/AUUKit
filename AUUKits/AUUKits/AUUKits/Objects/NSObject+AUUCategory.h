//
//  NSObject+AUUCategory.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @author JyHu, 15-11-16 10:11:52
 *
 *  @brief  C方法的Swizing
 *
 *  @param cls            方法所属的类 Class
 *  @param originSelector 原类的方法
 *  @param swizedSelector 自己的方法
 */
void methodExchangeImplementations(Class cls,
                                   SEL originSelector,
                                   SEL swizedSelector);

@interface NSObject (AUUCategory)

/**
 *  @author JyHu, 15-11-16 10:11:50
 *
 *  @brief  根类的swizing方法
 *
 *  @param originSelector 原类的方法
 *  @param swizedSelector 自己的方法
 */
+ (void)methodExchangeImplementationsWithOriginSelector:(SEL)originSelector
                                         swizedSelector:(SEL)swizedSelector;

@end
