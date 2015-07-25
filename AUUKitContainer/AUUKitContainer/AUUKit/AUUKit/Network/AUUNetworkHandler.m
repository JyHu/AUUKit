//
//  AUUNetworkHandler.m
//  AUUKit
//
//  Created by 胡金友 on 15/6/10.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUNetworkHandler.h"
#import "AUUString.h"
#import "AUUJSONAdaptor.h"

@interface AUUNetworkHandler()

@property (retain, nonatomic) NSOperationQueue *operationQueue;

@end

@implementation AUUNetworkHandler

@synthesize operationQueue = _operationQueue;

+ (AUUNetworkHandler *)shareInstance
{
    static AUUNetworkHandler *handler;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handler = [[AUUNetworkHandler alloc] init];
    });
    
    return handler;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _operationQueue = [[NSOperationQueue alloc] init];
        
        [_operationQueue setMaxConcurrentOperationCount:1];
    }
    
    return self;
}

- (void)setMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount
{
    [_operationQueue setMaxConcurrentOperationCount:maxConcurrentOperationCount];
}

- (void)getWithURLString:(NSString *)urlString
               successed:(void (^)(NSData *))successed
                  failed:(void (^)(NSError *))failed
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[urlString toURL]];
    
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:_operationQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError != nil)
        {
            failed(connectionError);
        }
        else
        {
            successed(data);
        }
    }];
}

- (void)postWithURLString:(NSString *)urlString
                   params:(NSDictionary *)params
                successed:(void (^)(NSData *))successed
                   failed:(void (^)(NSError *))failed
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[urlString toURL]];
    
    [request setHTTPMethod:@"POST"];
    
    [request setHTTPBody:[params JSONData]];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:_operationQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError != nil)
        {
            failed(connectionError);
        }
        else
        {
            successed(data);
        }
    }];
}

@end
