//
//  AUUMacro.h
//  CSDN
//
//  Created by 胡金友 on 15/5/18.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#ifndef CSDN_AUUMacro_h
#define CSDN_AUUMacro_h


#define kSYSTEM_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])

#define kCALL_7_API(API7, APIB7)           \
    if (kSYSTEM_VERSION >= 7.0){          \
        API7                                \
    }else{                                  \
        APIB7                               \
    }

#define kCALL_8_API(API8, APIB8)           \
    if (kSYSTEM_VERSION >= 8.0){          \
        API8                                \
    }else{                                  \
        APIB8                               \
    }

#define kVERSION_UP_TO_8 (kSYSTEM_VERSION >= 8.0)
#define kVERSION_UP_TO_7 (kSYSTEM_VERSION >= 7.0)
#define kVERSION_UP_TO_6 (kSYSTEM_VERSION >= 6.0)
#define kVERSION_7 (kSYSTEM_VERSION >= 7.0 && kSYSTEM_VERSION < 8.0)

#define AUUAssert(condition, alert)         \
    if (!(condition))                       \
    {                                       \
        NSLog(@"Warning:%@",alert);         \
    }


#define AUURAssert(condition, alert)        \
    if (!(condition))                       \
    {                                       \
        NSLog(@"Warning:%@",alert);         \
        return NO;                          \
    }                                       \
    return YES;



#define kMIN(A, B) ({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a < __b ? __a : __b; })
#define kMAX(A, B) ({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a > __b ? __a : __b; })


#define kPathTemp                   NSTemporaryDirectory()
#define kPathDocument               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathCache                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//#define kPathSearch                 [kPathDocument stringByAppendingPathComponent:@"Search.plist"]


#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#endif
