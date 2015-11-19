//
//  DrawView.m
//  AUUKits
//
//  Created by 胡金友 on 11/18/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "DrawView.h"
#import "UIView+AUUPlot.h"
#import "UIView+AUUCategory.h"

@implementation DrawView


- (void)drawRect:(CGRect)rect
{
    [self drawLinerGradientWithPoints:@[[NSValue valueWithCGPoint:CGPointMake(0, 0)],
                                        [NSValue valueWithCGPoint:CGPointMake(self.width, 0)],
                                        [NSValue valueWithCGPoint:CGPointMake(self.width, self.height)],
                                        [NSValue valueWithCGPoint:CGPointMake(0, self.height)]]
                           startColor:[UIColor blackColor]
                             endColor:[UIColor blueColor]
                        startLocation:AUULocationMake(0, 0.5)
                          endLocation:AUULocationMake(1, 0.5)];
}


@end
