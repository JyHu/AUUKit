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
#import "NSObject+AUUCategory.h"
#import "UIImage+AUUCategory.h"
#import "DrawView.h"
#import "UIColor+AUUCategory.h"
#import "AUUColorPickerView.h"
#import "AUUColorSlider.h"
#import "AUUColorPickerIndicator.h"

@interface ViewController ()

@property (retain, nonatomic) UILabel *label;

@property (retain, nonatomic) UIImage *image;

@property (retain, nonatomic) DrawView *dv;

@end

//#define AUUError(format, ...) printf("E%s\n", [[NSString stringWithFormat:@"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(format), ## __VA_ARGS__]] UTF8String]);

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    self.view.backgroundColor = [UIColor purpleColor];
    
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
    
//    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    self.label.textAlignment = NSTextAlignmentLeft;
//    self.label.lineBreakMode = NSLineBreakByCharWrapping;
//    self.label.numberOfLines = 0;
//    self.label.backgroundColor = [UIColor redColor];
//    self.label.autoFit = YES;
//    self.label.autoFitWidth = 100;
//    self.label.text = @" 你好啊 ";
//    [self.label setText:@" hello "];
//    [self.label setLineAttributedText:@"adfaljd"];
//    
//    [self.view addSubview:self.label];
    
//    NSLog(@"-- %@", [UIView catchMyAttributes]);
//    NSArray *Arr = [UIView catchMyMethods];
//    AUUError(@"afjakjsd ");
//    AUUDebug(@"%@", Arr);
//    NSLog(@"%@", Arr);
    
//    AUUError(@"%@", [UIView catchMyMethods]);
    
    AUUAsserts(0, @"要替换的值越界，最大可替换的值是%@，而要替换的值是%@", @(8), @(10));
    
    
//    self.view.backgroundColor = [[UIImage imageNamed:@"t.jpg"] colorAtPixel:CGPointMake(534, 742)];
    
    
    self.image = [UIImage imageNamed:@"t.jpg"];
    
//    self.image = [[UIImage imageNamed:@"t.jpg"] croppingInRect:CGRectMake(139, 221, 520, 520)];
    
//    UIImage *i = [[UIImage imageNamed:@"t.jpg"] scaleToSize:CGSizeMake(200, 200)];
//    NSLog(@"%@", NSStringFromCGSize(i.size));
    
    
//    self.image = [[UIImage imageNamed:@"t.jpg"] scaleToSize:CGSizeMake(200, 200)];
//    
//    
//    self.dv = [[DrawView alloc] initWithFrame:CGRectMake(50, 300, 200, 100)];
//    [self.view addSubview:self.dv];
    
    AUUColorPickerView *colorpicker = [AUUColorPickerView instanceWithFrame:self.view.bounds];
    colorpicker.alpha = 0;
    [colorpicker showInWindowWithduration:0.35 handleBlock:^{
        colorpicker.alpha = 1;
    }];
    
//    AUUColorSlider *slider = [[AUUColorSlider alloc] initWithFrame:CGRectMake(20, 200, self.view.width - 40, 40)];
//    [slider updateWithFromColor:[UIColor redColor] endColor:[UIColor blackColor]];
//    [slider colorSelectedCompletion:^(UIColor *color) {
//        self.view.backgroundColor = color;
//    }];
//    [self.view addSubview:slider];
    
    
//    AUUColorPickerIndicator *indicator = [AUUColorPickerIndicator instanceWithFrame:CGRectMake(20, 100, 160, 400)];
//    indicator.backgroundColor = RGBA(227, 223, 227, 1);
//    [self.view addSubview:indicator];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.label.text = arc4random() % 2 == 1 ? @" 那卡就当减肥垃圾堆里放假阿里的解放垃圾水电费看那看不卡SD卡就发生看得见放辣椒谁都不卡的看；激发了；带进来；啊就邓丽君法律；弹尽粮绝" : @"  ajdkfjalj ajdlj ";
//    [self.label sizeToFitWithWidth:100];
    NSString *str = arc4random() % 2 == 1 ? @" 那卡就当减肥垃圾堆里放假阿里的解放垃圾水电费看那看不卡SD卡就发生看得见放辣椒谁都不卡的看；激发了；带进来；啊就邓丽君法律；弹尽粮绝" : @"  ajdkfjalj ajdlj ";
    [self.label setLineAttributedText:str];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.dv];
    
//    CGPoint pt = CGPointMake((point.x / self.imageView.width) * self.image.size.width,
//                             (point.y / self.imageView.height) * self.image.size.height);
    
//    self.view.backgroundColor = [self.image colorAtPixel:pt];
    
    CGFloat scale = point.x / self.dv.width;
    
    self.view.backgroundColor = [UIColor regionColorFrom:[UIColor blackColor] toColor:[UIColor blueColor] atLocation:scale];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
