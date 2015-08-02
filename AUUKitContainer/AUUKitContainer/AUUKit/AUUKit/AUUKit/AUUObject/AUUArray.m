//
//  AUUArray.m
//  AUUKit
//
//  Created by 胡金友 on 15/5/24.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUArray.h"

@implementation NSArray (AUUArray)

- (NSArray *)reversalArray
{
    NSMutableArray *reversaledArray = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    
    for(id element in enumerator) [reversaledArray addObject:element];
    
    return reversaledArray;
}

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index < self.count)
    {
        return [self objectAtIndex:index];
    }
    
    return nil;
}

@end
