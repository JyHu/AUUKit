//
//  NSArray+JyHu.m
//  AUUKitContainer
//
//  Created by 胡金友 on 11/13/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "NSArray+JyHu.h"
#import "NSObject+JyHu.h"

#import <objc/runtime.h>

@implementation NSArray (JyHu)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodExchangeImplementationsWithOriginSelector:@selector(objectAtIndex:)
                                               swizedSelector:@selector(_objectAtIndex:)];
    });
    
    NSLog(@"%@", [@[@"m", @"n"] objectAtIndex:0]);
}

- (NSArray *)reversalArray
{
    NSMutableArray  *reversaledArray    = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator    *enumerator         = [self reverseObjectEnumerator];
    
    for(id element in enumerator) [reversaledArray addObject:element];
    
    return reversaledArray;
}

- (id)_objectAtIndex:(NSUInteger)index
{
    NSLog(@" haha ");
    
    if (index > self.count - 1)
    {
        return @" ";
    }
    
    return [self _objectAtIndex:index];
}

@end
