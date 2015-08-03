//
//  AUUImageView.m
//  AUUKit
//
//  Created by 胡金友 on 15/5/24.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUImageView.h"

@implementation UIImageView (AUUImageView)

+ (id)imageViewWithImage:(UIImage *)image
{
    return [[UIImageView alloc] initWithImage:image];
}

+ (id)imageViewImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    return [[UIImageView alloc] initWithImage:image highlightedImage:highlightedImage];
}


@end
