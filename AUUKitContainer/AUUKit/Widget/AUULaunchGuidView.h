//
//  AUULaunchGuidView.h
//  AUUKit
//
//  Created by 胡金友 on 15/7/25.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AUULaunchGuidCompletionBlock) ();

@interface AUULaunchGuidView : UIView


- (id)initWithImageNames:(NSArray *)imageNamesArr;


@property (copy, nonatomic) NSArray *imageNamesArr;

@property (copy, nonatomic) NSArray *gradientColorsArr;

- (void)show;


- (void)dismiss;


- (void)guidFinishWithCompletion:(AUULaunchGuidCompletionBlock)completion;

@end
