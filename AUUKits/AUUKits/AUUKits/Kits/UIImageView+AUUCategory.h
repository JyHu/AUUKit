//
//  UIImageView+AUUCategory.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (AUUCategory)

/**
 *  @author JyHu, 15-11-16 16:21:55
 *
 *  简单的初始化方法，代替了 alloc-init
 *
 *  @param image 图片
 *
 *  @return self
 */
+ (id)imageViewWithImage:(UIImage *)image;

/**
 *  @author JyHu, 15-11-16 16:22:05
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
