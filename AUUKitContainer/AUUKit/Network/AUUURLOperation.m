//
//  AUUURLOperation.m
//  AUUKit
//
//  Created by 胡金友 on 15/5/24.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUURLOperation.h"

@interface AUUURLOperation() <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (retain, nonatomic) NSURLRequest *request;

@end

@implementation AUUURLOperation

@synthesize request = _request;

- (id)initWithRequest:(NSURLRequest *)request
{
    self = [super init];
    
    if (self)
    {
        _request = request;
    }
    
    return self;
}

- (void)connection
{
//    NSHTTPURLResponse *response;
//    NSError *error;
    
}

@end
