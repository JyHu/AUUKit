//
//  AUUStorage.m
//  AUUKit
//
//  Created by 北京爱康泰科技有限责任公司 on 15/5/26.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUStorage.h"
#import "AUUNumber.h"

@implementation AUUStorage

+ (AUUStorage *)shareStorage
{
    static AUUStorage *storage;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        storage = [[AUUStorage alloc] init];
    });
    
    return storage;
}

@synthesize viewAllAnimationDuration = _viewAllAnimationDuration;

@synthesize imageViewDefaultImage = _imageViewDefaultImage;

@synthesize needAllViewAnimation = _needAllViewAnimation;

@synthesize defaultViewAnimationDuration = _defaultViewAnimationDuration;

- (NSTimeInterval)defaultViewAnimationDuration
{
    if (doubleEqual(_defaultViewAnimationDuration, 0))
    {
        return 0.5;
    }
    
    return _defaultViewAnimationDuration;
}

@end
