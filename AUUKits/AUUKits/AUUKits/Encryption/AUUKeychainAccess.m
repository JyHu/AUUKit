//
//  AUUKeychainAccess.m
//  AUUKits
//
//  Created by 胡金友 on 11/17/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "AUUKeychainAccess.h"
#import <Security/Security.h>

@interface AUUKeychainAccess()

@property (retain, nonatomic) NSMutableDictionary *keychainItemData;
@property (retain, nonatomic) NSMutableDictionary *genericPasswordQuery;

- (NSMutableDictionary *)secItemFormatToDictionary:(NSDictionary *)dictionaryToConvert;
- (NSMutableDictionary *)dictionaryToSecItemFormat:(NSDictionary *)dictionaryToConvert;

- (void)writeToKeychian;

@end

@implementation AUUKeychainAccess

@synthesize keychainItemData, genericPasswordQuery;

- (id)initWithIdentifier:(NSString *)identifier accessGroup:(NSString *)accessGroup
{
    if (self != [super init])
    {
        @autoreleasepool {
            
            genericPasswordQuery = [[NSMutableDictionary alloc] init];
            
            [genericPasswordQuery setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
            [genericPasswordQuery setObject:identifier forKey:(id)kSecAttrGeneric];
            
            if (accessGroup != nil)
            {
#if TARGET_IPHONE_SIMULATOR
                
#else
                [genericPasswordQuery setObject:accessGroup forKey:(id)kSecAttrAccessGroup];
#endif
            }
            
            [genericPasswordQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
            [genericPasswordQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnAttributes];
            
            NSDictionary *tempQuery = [NSDictionary dictionaryWithDictionary:genericPasswordQuery];
            
            NSMutableDictionary *outDictionary = nil;
            
            
            
        }
    }
    
    return self;
}

@end
