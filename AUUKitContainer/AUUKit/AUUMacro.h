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

#define IOS8_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define IOS7_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS6_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS5_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define IOS4_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"4.0"] != NSOrderedAscending )
#define IOS3_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"3.0"] != NSOrderedAscending )

#define IS_IPAD         (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)

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


// 废弃的API警告
#undef ignoredDeclarations
#define ignoredDeclarations(Stuff)          \
    do {                                    \
        _Pragma("clang diagnostic push")    \
        _Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
        Stuff                               \
        _Pragma("clang diagnostic pop")     \
    } while (0)


//国际化
#undef L
#define L(key) [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

//释放定时器
#define INVALIDATE_TIMER(__TIMER)   \
    {                               \
        [__TIMER invalidate];       \
        __TIMER = nil;              \
    }


//view安全释放
#define VIEW_RELEASE_SAFELY(__REF)    \
    {                                   \
        if (nil != (__REF))             \
        {                               \
            [__REF removeFromSuperview];\
        __REF = nil;                    \
        }                               \
    }

#endif
