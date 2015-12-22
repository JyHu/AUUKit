//
//  UITableViewCell+AUUCategory.m
//  AUUKits
//
//  Created by 胡金友 on 15/12/22.
//  Copyright © 2015年 Joyous Hu. All rights reserved.
//

#import "UITableViewCell+AUUCategory.h"

@implementation UITableViewCell (AUUCategory)

- (UITableView *)myContainerTable
{
    id tempSelf = self;
    
    do {
        tempSelf = [tempSelf superview];
    }while (![tempSelf isKindOfClass:[UITableView class]] || tempSelf == nil);
    
    return tempSelf ? (UITableView *)tempSelf : nil;
}

@end
