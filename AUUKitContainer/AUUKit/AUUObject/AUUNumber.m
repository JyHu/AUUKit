//
//  AUUNumber.m
//  AUUKit
//
//  Created by 胡金友 on 15/5/25.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUNumber.h"
#include <math.h>

BOOL doubleEqual(double d1, double d2)
{
    if (fabs(d1 - d2) < 10e-8)
    {
        return YES;
    }
    
    return NO;
}

NSUInteger generalInteger(NSUInteger start, NSUInteger end)
{
    uint32_t t = (uint32_t)((end > start) ? (end - start) : (start - end));
    
    return arc4random_uniform(t) + start;
}

NSUInteger bitUpdate(NSUInteger num, NSUInteger fIndex, NSUInteger length, NSUInteger value)
{
    NSUInteger max = 1<<length;
    
    if (value >= max)
    {
        NSLog(@"要替换的值越界，最大可替换的值是%@，而要替换的值是%@", @(max), @(value));
        return num;
    }
    
    return ((~(bitValue(num, fIndex, length) << fIndex)) && num) | (value << fIndex);
}

NSUInteger bitValue(NSUInteger num, NSUInteger fIndex, NSUInteger length)
{
    NSUInteger maxLocationGet = length + fIndex - 1;
    NSUInteger maxLocationSupport = sizeof(NSUInteger) * 4;
    
    if (maxLocationGet >= maxLocationSupport)
    {
        NSLog(@"要取的位置越界，最大可取位置到%@位，而当前要取到的数据是到%@位", @(maxLocationSupport), @(maxLocationGet));
        
        return 0;
    }
    
    return ((((1 << length) - 1) << fIndex) & num) >> fIndex;
}

NSUInteger bitTrueCount(NSUInteger num)
{
    NSUInteger trueValueCount = 0;
    
    NSUInteger temp = num;
    
    while (temp)
    {
        if (temp & 0x01)
        {
            trueValueCount ++ ;
        }
        
        temp = temp >> 1;
    }
    
    return trueValueCount;
}

NSInteger bitTrueIndex(NSUInteger num, NSUInteger index)
{
    NSUInteger temp = num;
    
    NSInteger bitIndex = -1;
    NSInteger trueCount = -1;
    
    while (temp)
    {
        if (temp & 1)
        {
            trueCount ++;
        }
        
        bitIndex ++;
        
        temp = temp >> 1;
        
        if (trueCount >= index)
        {
            break;
        }
    }
    
    if (trueCount < index)
    {
        bitIndex = -1;
    }
    
    return bitIndex;
}

NSInteger bitFalseIndex(NSUInteger num, NSUInteger index)
{
    NSUInteger temp = num;
    
    NSInteger bitIndex = -1;
    NSInteger falseCount = -1;
    
    while (1)
    {
        if (!(temp&1))
        {
            falseCount ++;
        }
        
        bitIndex ++;
        
        temp = temp >> 1;
        
        if (falseCount >= index)
        {
            break;
        }
    }
    
    if (falseCount < index)
    {
        bitIndex = -1;
    }
    
    return bitIndex;
}

@implementation NSNumber(AUUNumber)

@end
