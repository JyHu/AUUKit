//
//  AUUMacro.h
//  CSDN
//
//  Created by 胡金友 on 15/5/18.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#ifndef CSDN_AUUMacro_h
#define CSDN_AUUMacro_h


#define kAUUSystemVersion ([[[UIDevice currentDevice] systemVersion] floatValue])

#define kAUUCallB7TAPI(APIB7, API7T)        \
    if (kAUUSystemVersion >= 7.0){          \
        API7T                               \
    }else{                                  \
        APIB7                               \
    }

#define kAUUCallB8TAPI(APIB8, API8T)        \
    if (kAUUSystemVersion >= 8.0){          \
        API8T                               \
    }else{                                  \
        APIB8                               \
    }

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



#endif
