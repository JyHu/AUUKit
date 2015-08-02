//
//  AUUStringEncryption.h
//  AUUKit
//
//  Created by 北京爱康泰科技有限责任公司 on 15/5/27.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(AUUStringEncryption)

- (NSString *)MD5Hash;

- (NSData *)MD5128Bit;

- (NSData *)base64Data;

//- (NSString *)encryptMessageWithPassword:(NSString *)password;
//
//- (NSString *)decryptBase64EncodedStringWithPassword:(NSString *)password;

@end
