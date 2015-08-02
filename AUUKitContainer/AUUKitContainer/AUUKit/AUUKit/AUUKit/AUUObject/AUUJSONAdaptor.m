//
//  AUUJSONAdaptor.m
//  AUUKit
//
//  Created by 胡金友 on 15/5/24.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUJSONAdaptor.h"

NSStringEncoding converEncoding(CFStringEncodings encodingType)
{
    return CFStringConvertEncodingToNSStringEncoding(encodingType);
}

NSStringEncoding NSGBKStringEncoding()
{
    return converEncoding(kCFStringEncodingGB_18030_2000);
}

@implementation AUUJSONAdaptor

+ (NSStringEncoding)encodingWithStringEncodings:(CFStringEncodings)encodingType
{
    return CFStringConvertEncodingToNSStringEncoding(encodingType);
}

+ (id)objectFromJSONString:(NSString *)string encoding:(NSStringEncoding)encodingType
{
    NSData *data = [string dataUsingEncoding:encodingType];
    return [self objectFromJSONData:data encodingType:encodingType];
}

+ (id)mutableObjectFromJSONString:(NSString *)string encoding:(NSStringEncoding)encodingType
{
    NSData *data = [string dataUsingEncoding:encodingType];
    return [self mutableObjectFromJSONData:data encodingType:encodingType];
}

+ (id)objectFromJSONData:(NSData *)data encodingType:(NSStringEncoding)encodingType
{
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

+ (id)mutableObjectFromJSONData:(NSData *)data encodingType:(NSStringEncoding)encodingType
{
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

+ (NSString *)stringWithObject:(id)object encodingType:(NSStringEncoding)encodingType
{
    NSString *string = nil;
    
    NSData *data = [self dataWithObject:object encodingType:encodingType];
    
    if (data)
    {
        string = [[NSString alloc] initWithData:data encoding:encodingType];
    }
    
    return string;
}

+ (NSData *)dataWithObject:(id)object encodingType:(NSStringEncoding)encodingType
{
    NSData *data = nil;
    
    if ([NSJSONSerialization isValidJSONObject:object])
    {
        data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    }
    else
    {
        NSLog(@"Object %@ not a json object ", object);
    }
    
    return data;
}

@end


@implementation NSString(AUUJSONDeserialization)

- (id)objectFromJSONString
{
    return [self objectFromJSONStringWithEncoding:NSUTF8StringEncoding];
}

- (id)mutableObjectFromJSONString
{
    return [self mutableObjectFromJSONStringWithEncoding:NSUTF8StringEncoding];
}

- (id)objectFromJSONStringWithEncoding:(NSStringEncoding)encodingType
{
    return [AUUJSONAdaptor objectFromJSONString:self encoding:encodingType];
}

- (id)mutableObjectFromJSONStringWithEncoding:(NSStringEncoding)encodingType
{
    return [AUUJSONAdaptor mutableObjectFromJSONString:self encoding:encodingType];
}

@end

@implementation NSString(AUUJSONSerialization)

- (NSData *)JSONData
{
    return [self JSONDataWithEncoding:NSUTF8StringEncoding];
}

- (NSData *)JSONDataWithEncoding:(NSStringEncoding)encodingType
{
    return [AUUJSONAdaptor dataWithObject:self encodingType:encodingType];
}

- (NSString *)JSONString
{
    return [self JSONStringWithEncoding:NSUTF8StringEncoding];
}

- (NSString *)JSONStringWithEncoding:(NSStringEncoding)encodingType
{
    return [AUUJSONAdaptor stringWithObject:self encodingType:encodingType];
}

@end

@implementation NSData(AUUJSONDeserialization)

- (id)objectFromJSONData
{
    return [self objectFromJSONDataWithEncoding:NSUTF8StringEncoding];
}

- (id)mutableObjectFromJSONData
{
    return [self mutableObjectFromJSONDataWithEncoding:NSUTF8StringEncoding];
}

- (id)objectFromJSONDataWithEncoding:(NSStringEncoding)encodingType
{
    return [AUUJSONAdaptor objectFromJSONData:self encodingType:encodingType];
}

- (id)mutableObjectFromJSONDataWithEncoding:(NSStringEncoding)encodingType
{
    return [AUUJSONAdaptor mutableObjectFromJSONData:self encodingType:encodingType];
}

@end

@implementation NSArray (AUUJSONSerialization)

- (NSData *)JSONData
{
    return [self JSONDataWithEncoding:NSUTF8StringEncoding];
}

- (NSString *)JSONString
{
    return [self JSONStringWithEncoding:NSUTF8StringEncoding];
}

- (NSData *)JSONDataWithEncoding:(NSStringEncoding)encodingType
{
    return [AUUJSONAdaptor dataWithObject:self encodingType:encodingType];
}

- (NSString *)JSONStringWithEncoding:(NSStringEncoding)encodingType
{
    return [AUUJSONAdaptor stringWithObject:self encodingType:encodingType];
}

@end

@implementation NSDictionary(AUUJSONSerialization)

- (NSData *)JSONData
{
    return [self JSONDataWithEncoding:NSUTF8StringEncoding];
}

- (NSString *)JSONString
{
    return [self JSONStringWithEncoding:NSUTF8StringEncoding];
}

- (NSData *)JSONDataWithEncoding:(NSStringEncoding)encodingType
{
    return [AUUJSONAdaptor dataWithObject:self encodingType:encodingType];
}

- (NSString *)JSONStringWithEncoding:(NSStringEncoding)encodingType
{
    return [AUUJSONAdaptor stringWithObject:self encodingType:encodingType];
}

@end
