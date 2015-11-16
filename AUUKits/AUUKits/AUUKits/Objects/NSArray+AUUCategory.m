//
//  NSArray+AUUCategory.m
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "NSArray+AUUCategory.h"
#import "NSObject+AUUCategory.h"

@implementation NSArray (AUUCategory)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodExchangeImplementationsWithOriginSelector:@selector(objectAtIndex:)
                                               swizedSelector:@selector(_objectAtIndex:)];
        [self methodExchangeImplementationsWithOriginSelector:@selector(firstObject)
                                               swizedSelector:@selector(_firstObject)];
//        [self methodExchangeImplementationsWithOriginSelector:@selector(lastObject)
//                                               swizedSelector:@selector(_lastObject)];
    });
}

- (id)_objectAtIndex:(NSUInteger)index
{
    if (index > self.count - 1 || !self)
    {
        return @"";
    }
    
    return [self _objectAtIndex:index];
}

- (id)_firstObject
{
    if (self.count == 0 || !self)
    {
        return @"";
    }
    
    return [self _firstObject];
}

- (id)_lastObject
{
    if (self.count == 0 || !self)
    {
        return @"";
    }
    
    return [self _lastObject];
}

-(NSArray *)reversalArray
{
    NSMutableArray *reversaldArray = [[NSMutableArray alloc] initWithCapacity:self.count];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    
    for (id element in enumerator) [reversaldArray addObject:element];
    
    return reversaldArray;
}


@end
