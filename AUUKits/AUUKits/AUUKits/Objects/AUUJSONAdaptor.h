//
//  AUUJSONAdaptor.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

NSStringEncoding NSGBKStringEncoding();

NSStringEncoding converEncoding(CFStringEncodings encodingType);

@interface AUUJSONAdaptor : NSObject

+ (id)objectFromJSONString:(NSString *)string encoding:(NSStringEncoding)encodingType;
+ (id)mutableObjectFromJSONString:(NSString *)string encoding:(NSStringEncoding)encodingType;
+ (id)objectFromJSONData:(NSData *)data encodingType:(NSStringEncoding)encodingType;
+ (id)mutableObjectFromJSONData:(NSData *)data encodingType:(NSStringEncoding)encodingType;
+ (NSString *)stringWithObject:(id)object encodingType:(NSStringEncoding)encodingType;
+ (NSData *)dataWithObject:(id)object encodingType:(NSStringEncoding)encodingType;

@end


@interface NSString(AUUJSONDeserialization)

- (id)objectFromJSONString;

- (id)mutableObjectFromJSONString;

- (id)objectFromJSONStringWithEncoding:(NSStringEncoding)encodingType;

- (id)mutableObjectFromJSONStringWithEncoding:(NSStringEncoding)encodingType;

@end

@interface NSString(AUUJSONSerialization)

- (NSData *)JSONData;

- (NSString *)JSONString;

- (NSData *)JSONDataWithEncoding:(NSStringEncoding)encodingType;

- (NSString *)JSONStringWithEncoding:(NSStringEncoding)encodingType;

@end

@interface NSData(AUUJSONDeserialization)

- (id)objectFromJSONData;

- (id)mutableObjectFromJSONData;

- (id)objectFromJSONDataWithEncoding:(NSStringEncoding)encodingType;

- (id)mutableObjectFromJSONDataWithEncoding:(NSStringEncoding)encodingType;

@end

@interface NSArray(AUUJSONSerialization)

- (NSData *)JSONData;

- (NSString *)JSONString;

- (NSData *)JSONDataWithEncoding:(NSStringEncoding)encodingType;

- (NSString *)JSONStringWithEncoding:(NSStringEncoding)encodingType;

@end

@interface NSDictionary(AUUJSONSerialization)

- (NSData *)JSONData;

- (NSString *)JSONString;

- (NSData *)JSONDataWithEncoding:(NSStringEncoding)encodingType;

- (NSString *)JSONStringWithEncoding:(NSStringEncoding)encodingType;

@end

