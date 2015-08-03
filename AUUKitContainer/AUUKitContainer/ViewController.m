//
//  ViewController.m
//  AUUKitContainer
//
//  Created by 北京爱康泰科技有限责任公司 on 15/5/26.
//  Copyright (c) 2015年 北京爱康泰科技有限责任公司. All rights reserved.
//

#import "ViewController.h"
#import "TestDrawView.h"

@interface ViewController ()

@property (retain, nonatomic) UIImageView *tView;
//@property (retain, nonatomic) AUUPopView *popView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.tView = [[UIImageView alloc] initWithFrame:CGRectMake(generalInteger(0, 100), generalInteger(100, 200), generalInteger(200, 300), generalInteger(200, 400))];
//    self.tView.backgroundColor = [UIColor randomColor];
//    [self.tView setImageWithURLString:@"http://lovelace-media.imgix.net/getty/187587518.jpg?w=790&h=444&fit=crop&crop=faces&fm=jpg&q=65"];
//    [self.view addSubview:self.tView];
//    
//    TestDrawView *t = [[TestDrawView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:t];
//    
//    [[AUUNetworkHandler shareInstance] getWithURLString:@"http://syt.sf-express.com/css/newmobile/queryBillInfo.action?delivery_id=102950036775" successed:^(NSData *data) {
////        NSLog(@"%@",data);
//        NSDictionary *dict = [data mutableObjectFromJSONData];
//        NSLog(@"%@",dict);
//    } failed:^(NSError *error) {
//        NSLog(@"%@",error);
//    }];
//    
    
//    for (NSInteger i = 0 ; i < 100; i ++)
//    {
//        [[AUUNetworkHandler shareInstance] getWithURLString:@"http://t12.baidu.com/it/u=4095575894,102452705&fm=32&s=A98AA55F526172A6F6A058E50300A060&w=623&h=799&img.JPEG" successed:^(NSData *data) {
//            NSLog(@"successed");
//        } failed:^(NSError *error) {
//            NSLog(@"%@",error);
//        }];
//    }
    
//    NSLog(@"--%@\n%@",@(AUUKitVersionNumber), [[NSString alloc] initWithCString:AUUKitVersionString encoding:NSUTF8StringEncoding]);
    
//    [[AUUIndicator shareIndicator] showAutoHideIndicatorWithDelay:3];
    
//    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
//    v.backgroundColor = [UIColor redColor];
//    [[[[UIApplication sharedApplication] delegate] window] addSubview:v];
//    NSLog(@"%@",NSStringFromCGRect(v.frame));
//    
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//    if (!keyWindow)
//    {
//        NSArray *windows = [UIApplication sharedApplication].windows;
//        NSLog(@"%@",windows);
//        keyWindow = [windows firstObject];
//    }
//    NSLog(@"%@", @(keyWindow.windowLevel));
//    [keyWindow addSubview:v];
//    [keyWindow bringSubviewToFront:v];
//
//    UISwitch *s = [UISwitch instance];
//    NSLog(@"%@", NSStringFromClass([s class]));
    
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
