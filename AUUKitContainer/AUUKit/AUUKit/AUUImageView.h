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
 *  @author JyHu, 15-06-12 01:06:46
 *
 *  简单的初始化方法，代替了 alloc-init
 *
 *  @param image 图片
 *
 *  @return self
 */
+ (id)imageViewWithImage:(UIImage *)image;

/**
 *  @author JyHu, 15-06-12 01:06:09
 *
 *  简单的初始化方法，代替了 alloc-init
 *
 *  @param image            普通的image
 *  @param highlightedImage 高亮时的image
 *
 *  @return self
 */
+ (id)imageViewImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage;

@end
