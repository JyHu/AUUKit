//
//  UIImageView+AUUCategory.m
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "UIImageView+AUUCategory.h"

@implementation UIImageView (AUUCategory)

+ (id)imageViewWithImage:(UIImage *)image
{
    return [[UIImageView alloc] initWithImage:image];
}

+ (id)imageViewImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    return [[UIImageView alloc] initWithImage:image highlightedImage:highlightedImage];
}

@end
