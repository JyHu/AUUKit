//
//  UITableViewCell+AUUCategory.h
//  AUUKits
//
//  Created by 胡金友 on 15/12/22.
//  Copyright © 2015年 Joyous Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (AUUCategory)

/**
 *  @author JyHu, 15-12-22 10:12:58
 *
 *  获取当前cell所在的table
 *
 *  @return table
 *
 *  @since v1.0
 */
- (UITableView *)myContainerTable;

@end
