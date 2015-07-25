//
//  AUUDataEncryption.h
//  AUUKit
//
//  Created by 北京爱康泰科技有限责任公司 on 15/5/27.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData(AUUDataEncryption)

- (NSString *)MD5Hash;

- (NSData *)MD5128Bit;

- (NSString *)base64StringWithLength:(NSUInteger)length;

@end
