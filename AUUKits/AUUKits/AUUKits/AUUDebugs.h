//
//  AUUDebugs.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//






/**
 *  @author JyHu, 15-11-16 15:12:53
 *
 *  使用方法
 *
 *  打开工程文件，在Build Settings中的Preprocessor Macros的debug属性下添加一个字段 ‘DEBUG=1’
 *
 *  1、全局的使用
 *
 *      - 在项目文件中新建一个pch文件，然后import AUUKit.h 或者只import AUUDebug.h 文件
 *        然后调用 AUU_SET_DEBUG_LEVEL(x) 来设置log 的等级
 *
 *  2、单文件使用
 *
 *      - 同1，不过是在需要使用的文件中import
 *
 *
 *
 *  #define AUUError(format, ...)
 *
 *  #define AUUDebug(format, ...)
 *
 *  #define AUUAssert(condition, alert)
 *
 *  #define AUUAsserts(condition, format, ...) 
 *
 */




#ifndef AUUDebugs_h

/**
 *  @author JyHu, 15-11-16 15:11:55
 *
 *  @brief  用来根据不同的debug需求来显示log信息
 */
#define AUUDebugs_h

typedef enum{
    AUUDebugLevelDisable    = 0,    /*  隐藏调试log信息  */
    AUUDebugLevelError,             /*  只显示错误log信息  */
    AUUDebugLevelDebug              /*  显示所有的log信息  */
} AUUDebugLevel;


    #ifdef DEBUG

        #include <stdio.h>

        /**
         *  @author JyHu, 15-11-16 15:11:04
         *
         *  @brief  Debug Log等级的设定
         */
        #define AUU_SET_DEBUG_LEVEL(x) static int debugLevel = AUUDebugLevelDebug;

        /**
         *  @author JyHu, 15-11-16 15:11:40
         *
         *  @brief  Log Error
         */
        #define AUUError(format, ...)                                                                                       \
            do{                                                                                                             \
                printf("\n******************************* Error *******************************\n");                    \
                printf("* %s\n", [[NSString stringWithFormat:@"%@", [NSDate date]] UTF8String]);                        \
                printf("* [%s:%d] %s\n",  [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],    \
                                    __LINE__,                                                                           \
                                    [[NSString stringWithFormat:(format),## __VA_ARGS__] UTF8String]);                  \
                printf("*********************************************************************\n");                      \
            }while(0)


        /**
         *  @author JyHu, 15-11-16 15:11:14
         *
         *  @brief  Log Debug
         */
        #define AUUDebug(format, ...)                                                                                       \
            do{                                                                                                             \
                printf("D:- [%s:%d] %s\n",    [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
                                            __LINE__,                                                                   \
                                            [[NSString stringWithFormat:(format),## __VA_ARGS__] UTF8String]);          \
            }while(0)


        #define AUUAssert(condition, alert)         \
            if (!(condition))                       \
            {                                       \
                printf("\n******************************* Assert *******************************\n");                   \
                printf("* %s\n", [[NSString stringWithFormat:@"%@", [NSDate date]] UTF8String]);                        \
                printf("* [%s:%d] %s\n",    [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
                                            __LINE__, [(alert) UTF8String]);                                              \
                printf( "**********************************************************************\n");                    \
            }

        #define AUUAsserts(condition, format, ...)  \
            if (!(condition))                       \
            {                                       \
                printf("\n******************************* Assert *******************************\n");                   \
                printf("* %s\n", [[NSString stringWithFormat:@"%@", [NSDate date]] UTF8String]);                        \
                printf("* [%s:%d] %s\n",    [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
                                            __LINE__,                                                                   \
                                            [[NSString stringWithFormat:(format),## __VA_ARGS__] UTF8String]);          \
                printf( "**********************************************************************\n");                    \
            }


    #else   /* continue CONFIG_ENBLE_DEBUG */

        #define AUU_SET_DEBUG_LEVEL(x)
        #define AUUError(format, ...)
        #define AUUDebug(format, ...)
        #define AUUAssert(condition, alert)

    #endif  /* CONFIG_ENBLE_DEBUG */

#endif /* AUUDebugs_h */
