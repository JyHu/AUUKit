//
//  AUUMutableArray.h
//  AUUKit
//
//  Created by 胡金友 on 15/5/24.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray(AUUMutableArray)

/**
 *  @author JyHu, 15-05-26 23:05:31
 *
 *  数组的翻转
 *
 *  @return 翻转后的数组
 */
- (NSArray *)reversalArray;

/**
 *  @author JyHu, 15-05-26 23:05:52
 *
 *  安全的获取一个数组中的数据
 *
 *  @param index index
 *
 *  @return 获取结果
 */
- (id)safeObjectAtIndex:(NSUInteger)index;

@end
