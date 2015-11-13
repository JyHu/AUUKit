//
//  ViewController.m
//  AUUKitContainer
//
//  Created by 北京爱康泰科技有限责任公司 on 15/5/26.
//  Copyright (c) 2015年 北京爱康泰科技有限责任公司. All rights reserved.
//

#import "ViewController.h"
#import "TestDrawView.h"
#import "AUUStepMenu.h"
#import "AUUKit.h"
#import "NSArray+JyHu.h"

@interface ViewController ()

@property (retain, nonatomic) UIImageView *tView;
//@property (retain, nonatomic) AUUPopView *popView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *datasource = @[@"a", @"b", @{@"c" : @[@"d", @"e", @"f", @{@"g" : @[@"h", @"i", @"j"]}]}];
    
    NSLog(@"%@", [datasource objectAtIndex:1]);
}

- (void)viewDidAppear:(BOOL)animated
{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [[AUUIndicator shareIndicator] showIndicatorWithDuration:3];
//        [[AUUIndicator shareIndicator] showIndicator];
//    });
//    [_popView show];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //    self.tView.size = CGSizeMake(arc4random()%200+100, arc4random()%100+50);
//    self.tView.rect = CGRectMake(generalInteger(0, 100), generalInteger(20, 200), generalInteger(100, 200), generalInteger(100, 300));
//    self.tView.backgroundColor = [UIColor randomColor];
//    
//    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
