//
//  AUUImageView.m
//  AUUKit
//
//  Created by 胡金友 on 15/5/24.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUImageView.h"
#import "AUUStorage.h"
#import "AUUImageViewSyncCache.h"

static NSString *imageCachePath = @"Library/Caches/Image/Common";

@implementation UIImageView (AUUImageView)

+ (id)imageViewWithImage:(UIImage *)image
{
    return [[UIImageView alloc] initWithImage:image];
}

+ (id)imageViewImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    return [[UIImageView alloc] initWithImage:image highlightedImage:highlightedImage];
}

- (void)setImageWithURLString:(NSString *)urlString
{
    [[AUUImageViewSyncCache shareCache] setImageWithImageView:self andURLString:urlString];
}

+ (NSString *)imageCachePath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:imageCachePath];
}

+ (void)setDefaultImage:(UIImage *)image
{
    [AUUStorage shareStorage].imageViewDefaultImage = image;
}

@end
