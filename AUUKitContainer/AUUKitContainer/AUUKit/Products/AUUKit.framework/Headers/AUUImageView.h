//
//  AUUImageView.h
//  AUUKit
//
//  Created by 胡金友 on 15/5/24.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (AUUImageView)

/**
 *  @author JyHu, 15-05-26 23:05:25
 *
 *  异步的设置图片
 *
 *  @param urlString 图片的URL
 */
- (void)setImageWithURLString:(NSString *)urlString;

/**
 *  @author JyHu, 15-05-26 23:05:14
 *
 *  图片的缓存路径
 *
 *  @return Path
 */
+ (NSString *)imageCachePath;

/**
 *  @author JyHu, 15-05-26 23:05:35
 *
 *  如果本地没有该图片，则需要从网上下载，这时候的imageView的等待图片
 *
 *  @param image 等待图片
 */
+ (void)setDefaultImage:(UIImage *)image;

@end
