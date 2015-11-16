//
//  AUUMacros.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#ifndef AUUMacros_h
#define AUUMacros_h

#define kSystemVersion ([[[UIDevice currentDevice] systemVersion] floatValue])

#define kIOS9OrLater (kSystemVersion >= 9.0)
#define kIOS8OrLater (kSystemVersion >= 8.0)
#define kIOS7OrLater (kSystemVersion >= 7.0)
#define kIOS6OrLater (kSystemVersion >= 6.0)


#define kIsIPad         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define kMIN(A, B) ({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a < __b ? __a : __b; })
#define kMAX(A, B) ({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a > __b ? __a : __b; })


#define kPathTemp                    NSTemporaryDirectory()
#define kPathDocument               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathCache                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]


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


#endif /* AUUMacros_h */
