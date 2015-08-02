//
//  AUUNetworkHandler.h
//  AUUKit
//
//  Created by 胡金友 on 15/6/10.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AUUNetworkHandler : NSObject

/**
 *  @author JyHu, 15-06-10 23:06:21
 *
 *  单利对象
 *
 *  @return self
 */
+ (AUUNetworkHandler *)shareInstance;

/**
 *  @author JyHu, 15-06-10 23:06:18
 *
 *  设置最大并行的线程数
 */
@property (assign, nonatomic) NSInteger maxConcurrentOperationCount;

/**
 *  @author JyHu, 15-06-10 23:06:16
 *
 *  使用GET的方式请求数据
 *
 *  @param urlString URL地址
 *  @param successed 请求成功的BLOCK回调
 *  @param failed    请求失败的BLOCK回调
 */
- (void)getWithURLString:(NSString *)urlString
               successed:(void (^)(NSData *data))successed
                  failed:(void (^)(NSError *error))failed;

/**
 *  @author JyHu, 15-06-10 23:06:12
 *
 *  使用POST的方式请求数据
 *
 *  @param urlString URL地址
 *  @param params    参数字典
 *  @param successed 请求成功的BLOCK回调
 *  @param failed    请求失败的BLOCK回调
 */
- (void)postWithURLString:(NSString *)urlString
                   params:(NSDictionary *)params
                successed:(void (^)(NSData *data))successed
                   failed:(void (^)(NSError *error))failed;

@end
