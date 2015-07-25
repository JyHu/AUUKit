//
//  TestDrawView.m
//  AUUKitContainer
//
//  Created by 胡金友 on 15/6/7.
//  Copyright (c) 2015年 北京爱康泰科技有限责任公司. All rights reserved.
//

#import "TestDrawView.h"

@implementation TestDrawView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    [self drawRectangle:CGRectMake(20, 100, 200, 300) withRadius:-1 lineWidth:-1 pathDrawingModel:kCGPathFillStroke strokeColor:[UIColor greenColor] fillColor:[UIColor clearColor]];
//    [self drawPolygon:@[[NSValue valueWithCGPoint:CGPointMake(10, 30)],
//                        [NSValue valueWithCGPoint:CGPointMake(200, 50)],
//                        [NSValue valueWithCGPoint:CGPointMake(100, 200)],
//                        [NSValue valueWithCGPoint:CGPointMake(5, 70)]]
//            lineWidth:2
//          strokeColor:[UIColor redColor]
//            fillColor:[UIColor purpleColor]
//     pathDrawingModel:kCGPathFillStroke];
    
//    [self drawCircleWithCenter:CGPointMake(160, 300) radius:100 lineWidth:20 fillColor:[UIColor redColor] strokeColor:[UIColor greenColor] pathDrawingModel:kCGPathFillStroke];
    
//    [[UIColor redColor] set];
//    [self drawRectangle:CGRectMake(100, 200, 100, 300) withRadius:10 lineWidth:5 pathDrawingModel:kCGPathFill];
    
//    [self drawCurveFrom:CGPointMake(50, 100) to:CGPointMake(300, 400) controlPoint1:CGPointMake(100, 20) controlPoint2:CGPointMake(0, 300) lineWidth:5 fillColor:[UIColor redColor] strokeColor:[UIColor greenColor] pathDrawingModel:kCGPathStroke];
    
    
//    [self drawQuadCurveFrom:CGPointMake(50, 100) to:CGPointMake(100, 400) controlPoint:CGPointMake(300, 200) lineWidth:5 fillColor:[UIColor redColor] strokeColor:[UIColor greenColor] pathDrawingModel:kCGPathFillStroke];
    
//    [[UIColor redColor] set];
//    [self drawArcFromCenter:CGPointMake(160, 200) radius:100 startAngle:M_PI_4 endAngle:M_PI_2 clockWise:NO];
//    [self drawArcFromCenter:CGPointMake(160, 200) radius:100 startAngle:M_PI_4 endAngle:M_PI_2 lineWidth:5 color:[UIColor redColor] clockWise:YES];
    
//    [[UIColor redColor] setFill];
//    [[UIColor greenColor] setStroke];
//    [self drawSectorFromCenter:CGPointMake(160, 200) radius:100 startAngle:0 endAngle:M_PI * 2 clockWise:YES lineWidth:5 pathDrawingModel:kCGPathFillStroke];
    
//    [self drawShadowColor];
    
//    [self drawLinerGradientWithPoints:@[[NSValue valueWithCGPoint:CGPointMake(10, 100)],
//                                        [NSValue valueWithCGPoint:CGPointMake(100, 30)],
//                                        [NSValue valueWithCGPoint:CGPointMake(300, 500)],
//                                        [NSValue valueWithCGPoint:CGPointMake(10, 400)],
//                                        [NSValue valueWithCGPoint:CGPointMake(200, 300)]]
//                           startColor:[UIColor colorWithRed:0.5 green:0.3 blue:0.8 alpha:0]
//                             endColor:[UIColor greenColor]
//                        startLocation:AUULocationMake(0, 0.8)
//                          endLocation:AUULocationMake(1, 0.2)];
    
    [self drawLines:@[[NSValue valueWithCGPoint:CGPointMake(10, 100)],
                     [NSValue valueWithCGPoint:CGPointMake(100, 30)],
                     [NSValue valueWithCGPoint:CGPointMake(300, 500)],
                     [NSValue valueWithCGPoint:CGPointMake(10, 400)],
                      [NSValue valueWithCGPoint:CGPointMake(200, 300)]] lineWidth:5 color:[UIColor redColor]];
}


@end
