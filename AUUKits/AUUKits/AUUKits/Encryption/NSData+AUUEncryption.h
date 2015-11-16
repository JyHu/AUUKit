//
//  NSData+AUUEncryption.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AUUEncryption)

- (NSString *)MD5Hash;

- (NSData *)MD5128Bit;

- (NSString *)base64StringWithLength:(NSUInteger)length;

@end
