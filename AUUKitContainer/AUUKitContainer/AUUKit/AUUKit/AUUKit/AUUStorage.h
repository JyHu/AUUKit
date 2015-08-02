//
//  AUUStorage.h
//  AUUKit
//
//  Created by 北京爱康泰科技有限责任公司 on 15/5/26.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

/**
 *  @author JyHu, 15-06-12 01:06:06
 *
 *  用来管理包内的缓存数据
 */

#import <Foundation/Foundation.h>

#define kShareStorage ((AUUStorage *)[AUUStorage shareStorage])

@interface AUUStorage : NSObject

/**
 *  @author JyHu, 15-06-12 01:06:32
 *
 *  单例方法
 *
 *  @return self
 */
+ (AUUStorage *)shareStorage;

/**
 *  @author JyHu, 15-06-12 01:06:43
 *
 *  <#Description#>
 */
@property (assign, nonatomic) NSTimeInterval viewAllAnimationDuration;

@property (assign, nonatomic) BOOL needAllViewAnimation;

@property (retain, nonatomic) UIImage *imageViewDefaultImage;

@property (assign, nonatomic) NSTimeInterval defaultViewAnimationDuration;

@end
