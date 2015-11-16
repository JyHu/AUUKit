//
//  ViewController.m
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 胡金友. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AUUCategory.h"
#import "AUUMacros.h"
#import "AUUDebugs.h"
#import "UILabel+AUUCategory.h"

@interface ViewController ()

@property (retain, nonatomic) UILabel *label;

@end

//#define AUUError(format, ...) printf("E%s\n", [[NSString stringWithFormat:@"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(format), ## __VA_ARGS__]] UTF8String]);

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
//    printf("\n******************************* Error *******************************\n");
//    printf("%s", [[NSString stringWithFormat:@"%@", [NSDate date]] UTF8String]);
//    printf("[%s:%d] %s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:(format) ## __VA_ARGS__] UTF8String]);
//    printf("**********************************************************************\n");
    
//    CGRect rect = CGRectMake(100, 100, 100, 100);
    
//    NSArray *array = @[@1, @2, @3, @4, @5, @6];
//    AUUError(@"%@", [array firstObject]);
//    AUUError(@"%@", [array objectAtIndex:2]);
//    AUUError(@"%@", [array lastObject]);
    
    
//    CGRect r = resetRectXOrigin(rect, 200);
    
    
//    AUUError(@"%@ %@", NSStringFromCGRect(rect), NSStringFromCGRect(r));
    
    AUUAssert(1 > 2, @" 错误的判断 ");
    
    
    AUU_SET_DEBUG_LEVEL(AUUDebugLevelError);
    
    AUUError(@" debug log 测试 ");
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.label.textAlignment = NSTextAlignmentLeft;
    self.label.lineBreakMode = NSLineBreakByCharWrapping;
    self.label.numberOfLines = 0;
    self.label.backgroundColor = [UIColor redColor];
    self.label.autoFit = YES;
    self.label.autoFitWidth = 100;
//    self.label.text = @" 你好啊 ";
    [self.label setLineAttributedText:@"adfaljd"];
    
    [self.view addSubview:self.label];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.label.text = arc4random() % 2 == 1 ? @" 那卡就当减肥垃圾堆里放假阿里的解放垃圾水电费看那看不卡SD卡就发生看得见放辣椒谁都不卡的看；激发了；带进来；啊就邓丽君法律；弹尽粮绝" : @"  ajdkfjalj ajdlj ";
//    [self.label sizeToFitWithWidth:100];
    NSString *str = arc4random() % 2 == 1 ? @" 那卡就当减肥垃圾堆里放假阿里的解放垃圾水电费看那看不卡SD卡就发生看得见放辣椒谁都不卡的看；激发了；带进来；啊就邓丽君法律；弹尽粮绝" : @"  ajdkfjalj ajdlj ";
    [self.label setLineAttributedText:str];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
