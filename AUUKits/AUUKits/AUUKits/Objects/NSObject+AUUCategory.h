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

/**
 *  @author JyHu, 15-11-17 14:11:32
 *
 *  @brief  获取该类的所有方法
 *
 *  @return 方法数组
 */
+ (NSArray *)catchMyMethods;

/**
 *  @author JyHu, 15-11-17 14:11:00
 *
 *  @brief  获取该类的所有属性
 *
 *  @return 属性数组
 */
+ (NSArray *)catchMyAttributes;

/**
 *  @author JyHu, 15-11-17 14:11:16
 *
 *  @brief  动态的给实例对象添加属性
 *
 *  @param key   属性的key
 *  @param value 属性的值
 */
- (void)setAssociatedPropertyWithKey:(const char *)key andValue:(id)value;

/**
 *  @author JyHu, 15-11-17 14:11:43
 *
 *  @brief  获取动态添加的属性的值
 *
 *  @param key 属性的key
 *
 *  @return 属性的值
 */
- (id)getAssociatedPropertyWithKey:(const char *)key;

@end
