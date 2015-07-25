//
//  AUUNumber.h
//  AUUKit
//
//  Created by 胡金友 on 15/5/25.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kGoldenRatio ((sqrt(5) - 1) / 2.0)

/**
 *  @author JyHu, 15-05-26 14:05:18
 *
 *  @brief  double 类型的数据的比较，因为double类型的数据在底层存储的时候会有很小的误差
 *
 *  @param d1 比较数1
 *  @param d2 比较熟2
 *
 *  @return 是否相等
 */
BOOL doubleEqual(double d1, double d2);

/**
 *  @author JyHu, 15-05-26 14:05:35
 *
 *  @brief  随机生成一个整数
 *
 *  @param start 最小值
 *  @param end   最大值
 *
 *  @return 随机数
 */
NSUInteger generalInteger(NSUInteger start, NSUInteger end);

/**
 *  @author JyHu, 15-05-26 14:05:29
 *
 *  @brief  把一个整型数的中间某些位替换成需要的数
 *
 *  @param num    要操作的数
 *  @param fIndex 开始位置
 *  @param length 要替换的长度
 *  @param value  用来替换的值
 *
 *  @return 替换后的整数
 */
NSUInteger bitUpdate(NSUInteger num, NSUInteger fIndex, NSUInteger length, NSUInteger value);

/**
 *  @author JyHu, 15-05-26 14:05:28
 *
 *  @brief  获取一个整型数的中间某些位的数值
 *
 *  @param num    要操作的数
 *  @param fIndex 开始的位置
 *  @param length 要获取的长度
 *
 *  @return 取到的数值
 */
NSUInteger bitValue(NSUInteger num, NSUInteger fIndex, NSUInteger length);

/**
 *  @author JyHu, 15-05-26 14:05:26
 *
 *  @brief  计算一个整型的数有多少个‘1’
 *
 *  @param num 要计算的数
 *
 *  @return 计算结果
 */
NSUInteger bitTrueCount(NSUInteger num);

/**
 *  @author JyHu, 15-05-26 14:05:17
 *
 *  @brief  计算第index个‘1’是第几位
 *
 *  @param num   要操作的数
 *  @param index 编号，从‘0’开始
 *
 *  @return 第几位
 */
NSInteger bitTrueIndex(NSUInteger num, NSUInteger index);

/**
 *  @author JyHu, 15-05-26 14:05:40
 *
 *  @brief  计算第index个‘0’是第几位
 *
 *  @param num   要操作的数
 *  @param index 编号
 *
 *  @return 第几位
 */
NSInteger bitFalseIndex(NSUInteger num, NSUInteger index);

@interface NSNumber(AUUNumber)

@end
