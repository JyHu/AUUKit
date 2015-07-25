//
//  AUUPlotView.m
//  AUUKit
//
//  Created by 胡金友 on 15/5/19.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUPlotView.h"
#import "AUUColor.h"

@implementation UIView(AUUPlotView)

- (void)drawLineFrom:(CGPoint)startPoint to:(CGPoint)endPoint width:(CGFloat)width
{
    AUUAssert(width > 0, @"线段宽度不合法");
    
    CGFloat w = (width > 0 ? width : 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
    CGContextSetLineWidth(context, w);
    
    CGContextStrokePath(context);
}

- (void)drawLineFrom:(CGPoint)startPoint to:(CGPoint)endPoint width:(CGFloat)width color:(UIColor *)color
{
    [color set];
    
    [self drawLineFrom:startPoint to:endPoint width:width];
}

- (void)drawRectangle:(CGRect)rect withRadius:(CGFloat)radius lineWidth:(CGFloat)lineWidth pathDrawingModel:(CGPathDrawingMode)model
{
    AUUAssert(lineWidth > 0, @"线段宽度必须大于0");
    AUUAssert(radius >= 0, @"圆角弧度不能小于0");
    
    CGFloat w = (lineWidth <= 0 ? 1 : lineWidth);
    CGFloat r = (radius <=0 ? 0 : radius);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef pathRef = [self pathwithFrame:rect withRadius:r];
    CGContextAddPath(context, pathRef);
    CGContextSetLineWidth(context, w);
    CGContextDrawPath(context, model);
    
    CGPathRelease(pathRef);
}

- (void)drawRectangle:(CGRect)rect withRadius:(CGFloat)radius lineWidth:(CGFloat)lineWidth strokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor pathDrawingModel:(CGPathDrawingMode)model
{
    [strokeColor setStroke];
    [fillColor setFill];

    [self drawRectangle:rect withRadius:radius lineWidth:lineWidth pathDrawingModel:model];
}

- (void)drawPolygon:(NSArray *)pointArray lineWidth:(CGFloat)width pathDrawingModel:(CGPathDrawingMode)model
{
    NSAssert(pointArray.count>=2,@"数组长度必须大于等于2");
    NSAssert([[pointArray[0] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
    AUUAssert(width > 0, @"线段宽度必须大于0");
    
    CGFloat w = (width > 0 ? width : 1);
    
    CGContextRef     context = UIGraphicsGetCurrentContext();

    NSValue *startPointValue = pointArray[0];
    CGPoint  startPoint      = [startPointValue CGPointValue];
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    
    for(int i = 1;i<pointArray.count;i++)
    {
        NSAssert([[pointArray[i] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
        
        NSValue *pointValue = pointArray[i];
        CGPoint  point      = [pointValue CGPointValue];
        CGContextAddLineToPoint(context, point.x,point.y);
    }
    
    CGContextAddLineToPoint(context, startPoint.x, startPoint.y);
    CGContextSetLineWidth(context, w);
    CGContextDrawPath(context, model);
}

- (void)drawPolygon:(NSArray *)pointArray lineWidth:(CGFloat)width strokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor pathDrawingModel:(CGPathDrawingMode)model
{
    [strokeColor setStroke];
    [fillColor setFill];
    
    [self drawPolygon:pointArray lineWidth:width pathDrawingModel:model];
}

- (void)drawCircleWithCenter:(CGPoint)center radius:(CGFloat)radius lineWidth:(CGFloat)width pathDrawingModel:(CGPathDrawingMode)model
{
    AUUAssert(width > 0, @"线段宽度必须大于0");
    AUUAssert(radius > 0, @"半径必须大于0");
    
    CGFloat r = (radius > 0 ? radius : 50);
    CGFloat w = (width > 0 ? width : 1);
    
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGPathAddArc(pathRef,
                 &CGAffineTransformIdentity,
                 center.x,
                 center.y,
                 r,
                 0,
                 2 * M_PI,
                 NO);
    
    CGPathCloseSubpath(pathRef);
    CGContextAddPath(context, pathRef);
    CGContextSetLineWidth(context, w);
    CGContextDrawPath(context,model);
    
    CGPathRelease(pathRef);
}

- (void)drawCircleWithCenter:(CGPoint)center radius:(CGFloat)radius lineWidth:(CGFloat)width fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor pathDrawingModel:(CGPathDrawingMode)model
{
    [fillColor setFill];
    [strokeColor setStroke];
    
    [self drawCircleWithCenter:center radius:radius lineWidth:width pathDrawingModel:model];
}

- (void)drawCurveFrom:(CGPoint)startPoint to:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2 lineWidth:(CGFloat)width
{
    AUUAssert(width > 0, @"线段宽度必须大于0");
    
    CGFloat w = (width > 0 ? width : 1);
    
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    
    CGContextAddCurveToPoint(context,
                             controlPoint1.x,
                             controlPoint1.y,
                             controlPoint2.x,
                             controlPoint2.y,
                             endPoint.x,
                             endPoint.y);
    CGContextSetLineWidth(context, w);
    
    CGContextStrokePath(context);
}

- (void)drawCurveFrom:(CGPoint)startPoint to:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2 lineWidth:(CGFloat)width color:(UIColor *)color
{
    [color set];
    
    [self drawCurveFrom:startPoint to:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2 lineWidth:width];
}

- (void)drawQuadCurveFrom:(CGPoint)startPoint to:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint lineWidth:(CGFloat)width
{
    AUUAssert(width > 0, @"线段宽度必须大于0");
    
    CGFloat w = (width > 0 ? width : 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddQuadCurveToPoint(context, controlPoint.x, controlPoint.y, endPoint.x, endPoint.y);
    CGContextSetLineWidth(context, w);
    
    CGContextStrokePath(context);
}

- (void)drawQuadCurveFrom:(CGPoint)startPoint to:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint lineWidth:(CGFloat)width color:(UIColor *)color
{
    [color set];
    
    [self drawQuadCurveFrom:startPoint to:endPoint controlPoint:controlPoint lineWidth:width];
}

- (void)drawArcFromCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle lineWidth:(CGFloat)width clockWise:(BOOL)clockwise
{
    AUUAssert(width > 0, @"线段宽度必须大于0");
    AUUAssert(radius > 0, @"半径必须大于0");
    
    CGFloat r = (radius > 0 ? radius : 50);
    CGFloat w = (width > 0 ? width : 1);
    
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(context,
                    center.x,
                    center.y,
                    r,
                    startAngle,
                    endAngle,
                    clockwise?0:1);
    
    CGContextSetLineWidth(context, w);
    
    CGContextStrokePath(context);
}

- (void)drawArcFromCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle lineWidth:(CGFloat)width color:(UIColor *)color clockWise:(BOOL)clockwise
{
    [color set];
    
    [self drawArcFromCenter:center radius:radius startAngle:startAngle endAngle:endAngle lineWidth:width clockWise:clockwise];
}

- (void)drawSectorFromCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockWise:(BOOL)clockWise lineWidth:(CGFloat)width pathDrawingModel:(CGPathDrawingMode)model
{
    AUUAssert(width > 0, @"线段宽度必须大于0");
    AUUAssert(radius > 0, @"半径必须大于0");
    
    CGFloat r = (radius > 0 ? radius : 50);
    CGFloat w = (width > 0 ? width : 1);
    
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, center.x, center.y);
    
    CGContextAddArc(context,
                    center.x,
                    center.y,
                    r,
                    startAngle,
                    endAngle,
                    clockWise?0:1);
    
    CGContextSetLineWidth(context, w);
    
    CGContextClosePath(context);
    
    CGContextDrawPath(context,model);
}

- (void)drawSectorFromCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockWise:(BOOL)clockWise lineWidth:(CGFloat)width fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor pathDrawingModel:(CGPathDrawingMode)model
{
    [fillColor setFill];
    [strokeColor setStroke];
    
    [self drawSectorFromCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockWise:clockWise lineWidth:width pathDrawingModel:model];
}

- (void)drawLinerGradientWithPoints:(NSArray *)pointsArr
                         startColor:(UIColor *)sColor
                           endColor:(UIColor *)eColor
                      startLocation:(AUULocation)sLocation
                        endLocation:(AUULocation)eLocation
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    NSValue *startPointValue = pointsArr[0];
    CGPoint  startPoint      = [startPointValue CGPointValue];
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
    
    for(int i = 1;i<pointsArr.count;i++)
    {
        NSAssert([[pointsArr[i] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
        
        NSValue *pointValue = pointsArr[i];
        CGPoint  point      = [pointValue CGPointValue];
        CGPathAddLineToPoint(path, NULL, point.x, point.y);
    }
    CGPathCloseSubpath(path);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};
    NSArray *colors = @[(__bridge id)sColor.CGColor, (__bridge id)eColor.CGColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    CGRect pathRect = CGPathGetBoundingBox(path);
    CGPoint sPoint = CGPointMake(CGRectGetMinX(pathRect) + sLocation.x * CGRectGetWidth(pathRect),
                                 CGRectGetMinY(pathRect) + sLocation.y * CGRectGetHeight(pathRect));
    CGPoint ePoint = CGPointMake(CGRectGetMinX(pathRect) + eLocation.x * CGRectGetWidth(pathRect),
                                 CGRectGetMinY(pathRect) + eLocation.y * CGRectGetHeight(pathRect));
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, sPoint, ePoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

- (void)drawLines:(NSArray *)pointArray lineWidth:(CGFloat)width
{
    NSAssert(pointArray.count>=2,@"数组长度必须大于等于2");
    NSAssert([[pointArray[0] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
    
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    NSValue *startPointValue = pointArray[0];
    CGPoint  startPoint      = [startPointValue CGPointValue];
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    /**
     *  @author JyHu, 15-06-10 15:06:23
     *
     *  表示绘制10像素，然后空20，绘制40，空10，绘制20，空40 ……
     */
//    CGFloat lengths[] = {5, 20, 40};
//    CGContextSetLineDash(context, 0, lengths, (int)sizeof(lengths)/sizeof(lengths[0]));
    for(int i = 1;i<pointArray.count;i++)
    {
        NSAssert([[pointArray[i] class] isSubclassOfClass:[NSValue class]], @"数组成员必须是CGPoint组成的NSValue");
        NSValue *pointValue = pointArray[i];
        CGPoint  point      = [pointValue CGPointValue];
        CGContextAddLineToPoint(context, point.x,point.y);
    }
    
    CGContextStrokePath(context);
}

- (void)drawLines:(NSArray *)pointArray lineWidth:(CGFloat)width color:(UIColor *)color
{
    [color set];
    
    [self drawLines:pointArray lineWidth:width];
}

-(CGMutablePathRef)pathwithFrame:(CGRect)frame withRadius:(float)radius
{
    CGPoint x1,x2,x3,x4; //x为4个顶点
    CGPoint y1,y2,y3,y4,y5,y6,y7,y8; //y为8个控制点
    
    //
    //  从左上角顶点开始，顺时针旋转,x1->y1->y2->x2
    //
    //  x1--y1---------------------------y2--x2
    //  |                                     |
    //  y8                                   y3
    //  |                                     |
    //  |                                     |
    //  |                                     |
    //  y7                                   y4
    //  |                                     |
    //  x4--y6---------------------------y5--x3
    //
    
    x1 = frame.origin;
    x2 = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y);
    x3 = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y + frame.size.height);
    x4 = CGPointMake(frame.origin.x                   , frame.origin.y + frame.size.height);
    
    
    y1 = CGPointMake(frame.origin.x + radius, frame.origin.y);
    y2 = CGPointMake(frame.origin.x + frame.size.width-radius, frame.origin.y);
    y3 = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y+radius);
    y4 = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y+frame.size.height-radius);
    
    y5 = CGPointMake(frame.origin.x+frame.size.width-radius, frame.origin.y+frame.size.height);
    y6 = CGPointMake(frame.origin.x+radius, frame.origin.y+frame.size.height);
    y7 = CGPointMake(frame.origin.x, frame.origin.y+frame.size.height-radius);
    y8 = CGPointMake(frame.origin.x, frame.origin.y+radius);
    
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    if (radius <= 0)
    {
        CGPathMoveToPoint(pathRef,    &CGAffineTransformIdentity, x1.x,x1.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x2.x,x2.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x3.x,x3.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x4.x,x4.y);
    }else
    {
        CGPathMoveToPoint(pathRef,    &CGAffineTransformIdentity, y1.x,y1.y);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y2.x,y2.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x2.x,x2.y,y3.x,y3.y,radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y4.x,y4.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x3.x,x3.y,y5.x,y5.y,radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y6.x,y6.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x4.x,x4.y,y7.x,y7.y,radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y8.x,y8.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x1.x,x1.y,y1.x,y1.y,radius);
    }
    
    
    CGPathCloseSubpath(pathRef);
    
    return pathRef;
}

@end
