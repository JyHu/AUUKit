//
//  AUUDebug.h
//  AUUKit
//
//  Created by 胡金友 on 15/5/18.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

/**
 *  @author JyHu, 15-05-27 00:05:29
 *
 *  使用方法
 *
 *  1、全局的使用
 *
 *      - 在项目文件中新建一个pch文件，然后import AUUKit.h 或者只import AUUDebug.h 文件
 *        然后调用 AUU_SET_DEBUG_LEVEL(x) 来设置log 的等级
 *
 *  2、单文件使用
 *
 *      - 同1，不过是在需要使用的文件中import
 */

#ifndef AUUKit_AUUDebug_h


    /**
     *  @author JyHu, 15-05-18 22:05:01
     *
     *  用来根据需求显示不同的调试信息
     */

    #define AUUKit_AUUDebug_h

    /**
     *  @author JyHu, 15-05-18 22:05:01
     *
     *  Debug控制
     */
    #define CONFIG_ENBLE_DEBUG

    /**
     *  @author JyHu, 15-05-18 22:05:01
     *
     *  Debug等级的控制
     */
    typedef enum{
        AUUDebugLevelDisable    = 0,    /*  隐藏调试log信息  */
        AUUDebugLevelError,             /*  只显示错误log信息  */
        AUUDebugLevelInfo,              /*  显示Info、Error log 信息 */
        AUUDebugLevelDebug              /*  显示所有的log信息  */
    } AUUDebugLevel;

    #ifdef CONFIG_ENBLE_DEBUG

        #include <stdio.h>

        /**
         *  @author JyHu, 15-05-18 22:05:01
         *
         *  Debug等级的设定
         *
         *  @param x AUUDebugLevel
         */
        #define AUU_SET_DEBUG_LEVEL(x) static int debug = x

        /**
         *  @author JyHu, 15-05-19 10:05:39
         *
         *  @brief  Log Error
         */
        #define AUUError(format, ...)                               \
            do{                                                     \
                if (debug >= AUUDebugLevelError){                   \
                    NSLog(@"E<%@:(%d)> %@",                         \
                          [[NSString stringWithUTF8String:__FILE__] lastPathComponent],       \
                          __LINE__,                                                         \
                          [NSString stringWithFormat:(format),## __VA_ARGS__]);             \
                }                                                                           \
            }while(0)



        /**
         *  @author JyHu, 15-05-19 10:05:58
         *
         *  @brief  Log Info
         */
        #define AUUInfo(format, ...)                        \
            do {                                            \
                if (debug >= AUUDebugLevelInfo){            \
                    NSLog(@"I<%@:(%d)> %@",                 \
                          [[NSString stringWithUTF8String:__FILE__] lastPathComponent],       \
                          __LINE__,                                                         \
                          [NSString stringWithFormat:(format), ## __VA_ARGS__]);            \
                }                                                                           \
            }while(0)




        /**
         *  @author JyHu, 15-05-19 10:05:12
         *
         *  @brief  Log Debug
         */
        #define AUUDebug(format, ...)                       \
            do{                                             \
                if (debug >= AUUDebugLevelDebug){           \
                    NSLog(@"D<%@:(%d)> %@",                 \
                          [[NSString stringWithUTF8String:__FILE__] lastPathComponent],      \
                          __LINE__,                                                         \
                          [NSString stringWithFormat:(format), ## __VA_ARGS__]);            \
                }                                                                           \
            }while(0)

    #else   /* continue CONFIG_ENBLE_DEBUG */

        #define AUU_SET_DEBUG_LEVEL(x)
        #define AUUAssert()
        #define AUUError(format, ...)
        #define AUUInfo(format, ...)
        #define AUUDebug(format, ...)


    #endif  /* end CONFIG_ENBLE_DEBUG */


#endif  /* end AUUKit_AUUDebug_h */





