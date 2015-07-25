//
//  AUUImageViewSyncCache.h
//  AUUKit
//
//  Created by 北京爱康泰科技有限责任公司 on 15/5/26.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AUUImageViewSyncCache : UIView

+ (AUUImageViewSyncCache *)shareCache;

/**
 *  @author JyHu, 15-05-26 23:05:28
 *
 *  异步设置图片
 *
 *  @param imageView UIImageView
 *  @param urlStr    图片的url
 */
- (void)setImageWithImageView:(UIImageView *)imageView andURLString:(NSString *)urlStr;

@end
