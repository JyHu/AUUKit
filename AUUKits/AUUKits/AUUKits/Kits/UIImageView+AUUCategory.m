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
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

+ (id)imageViewImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image
                                               highlightedImage:highlightedImage];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

@end
