//
//  AUUImageViewSyncCache.m
//  AUUKit
//
//  Created by 北京爱康泰科技有限责任公司 on 15/5/26.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUImageViewSyncCache.h"
#import "AUUImageView.h"
//#import "AUUString.h"
#import "AUUStorage.h"
#import "AUUStringEncryption.h"

@implementation AUUImageViewSyncCache
{
    dispatch_queue_t _myQueue;
    NSMutableSet *_imageCacheSet;
}

+ (AUUImageViewSyncCache *)shareCache
{
    static AUUImageViewSyncCache *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[AUUImageViewSyncCache alloc] init];
    });
    
    return cache;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _myQueue = dispatch_queue_create("com.jyhu.concurrentqueue", DISPATCH_QUEUE_CONCURRENT);
        _imageCacheSet = [[NSMutableSet alloc] init];
    }
    
    return self;
}

- (void)setImageWithImageView:(UIImageView *)imageView andURLString:(NSString *)urlStr
{
    dispatch_async(_myQueue, ^{
        
        NSString *p_urlString = [urlStr copy];
        
        NSData *imageData;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *pathStr = [UIImageView imageCachePath];
        NSString *imagePath = [pathStr stringByAppendingPathComponent:[p_urlString MD5Hash]];
        
        if (![fileManager fileExistsAtPath:pathStr])
        {
            [fileManager createDirectoryAtPath:pathStr withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        if ([fileManager fileExistsAtPath:imagePath])
        {
            imageData = [NSData dataWithContentsOfFile:imagePath];
            
            if (imageData.length > 0)
            {
                UIImage *image = [UIImage imageWithData:imageData];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [imageView setImage:image];
                });
            }
        }
        else
        {
            BOOL hadAdded = NO;
            
            for (NSDictionary *dict in _imageCacheSet)
            {
                if ([[[dict allKeys] firstObject] isEqualToString:[p_urlString MD5Hash]])
                {
                    hadAdded = YES;
                    
                    break ;
                }
            }
            
            [_imageCacheSet addObject:@{[p_urlString MD5Hash] : imageView}];
            
            if (hadAdded)
            {
                return;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [imageView setImage:[AUUStorage shareStorage].imageViewDefaultImage];
            });
            
            imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:p_urlString]];
            
            if (imageData == nil)
            {
                [imageView setImageWithURLString:p_urlString];
            }
            else
            {
                [imageData writeToFile:imagePath atomically:YES];
                
                UIImage *image = [UIImage imageWithData:imageData];
                
                for (NSDictionary *dict in _imageCacheSet)
                {
                    if ([[[dict allKeys] firstObject] isEqualToString:[p_urlString MD5Hash]])
                    {
                        UIImageView *iv = (UIImageView *)[dict objectForKey:[[dict allKeys] firstObject]];
                        
                        if (iv)
                        {
                            dispatch_async(dispatch_get_main_queue(), ^{
                                
                                [iv setImage:image];
                            });
                        }
                        
                        [_imageCacheSet removeObject:dict];
                    }
                }
            }
        }
    });
}

@end
