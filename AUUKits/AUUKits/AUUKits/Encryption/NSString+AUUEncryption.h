//
//  NSString+AUUEncryption.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AUUEncryption)

- (NSString *)MD5Hash;

- (NSData *)MD5128Bit;

- (NSData *)base64Data;

@end
