//
//  AUUStepMenu.h
//  AUUKitContainer
//
//  Created by 胡金友 on 15/8/3.
//  Copyright (c) 2015年 北京爱康泰科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AUUStepMenu : UIView

/**
 *  @author JyHu, 15-08-03 17:08:26
 *
 *  初始化方法
 *
 *  @param frame      Frame
 *  @param dataSource 数据源，传进来的必须是（字符串 或 字典 或者 两者混合的）数组，字典的value必须是数组，便于分级
 *
 *  @return self
 *
 *  @since  v 1.0
 */
- (id)initWithFrame:(CGRect)frame
         dataSource:(NSArray *)dataSource;

/**
 *  @author JyHu, 15-08-03 17:08:12
 *
 *  数据源，当调用它的set方法的时候就会开始布局，就是说用View其他的初始化方法也可以。
 *
 *  @since  v 1.0
 */
@property (retain, nonatomic) NSArray *dataSource;

@end
