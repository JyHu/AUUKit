//
//  AUUKeychainAccess.h
//  AUUKits
//
//  Created by 胡金友 on 11/17/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AUUKeychainAccess : NSObject

- (id)initWithIdentifier:(NSString *)identifier accessGroup:(NSString *)accessGroup;
- (void)setObject:(id)inObject forKey:(id)key;
- (id)objectForKey:(id)key;
- (void)resetKeyChainItem;

@end
