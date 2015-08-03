//
//  AUUPlotView.h
//  AUUKit
//
//  Created by 胡金友 on 15/5/19.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <UIKit/UIKit.h>

struct AUULocation {
    CGFloat x;  // 0 ~ 1
    CGFloat y;  // 0 ~ 1
};
typedef struct AUULocation AUULocation;

AUULocation AUULocationMake(CGFloat x, CGFloat y);

@interface UIView(AUUPlotView)

/**
 *  @author JyHu, 15-06-07 18:06:06
 *
 *  绘制直线
 *
 *  @param startPoint 开始坐标
 *  @param endPoint   结束坐标
 *  @param width      线宽
 */
- (void)drawLineFrom:(CGPoint)startPoint
                  to:(CGPoint)endPoint
               width:(CGFloat)width;

/**
 *  @author JyHu, 15-06-07 18:06:58
 *
 *  绘制直线
 *
 *  @param startPoint 开始坐标
 *  @param endPoint   结束坐标
 *  @param width      线宽
 *  @param color      线条颜色
 */
- (void)drawLineFrom:(CGPoint)startPoint
                  to:(CGPoint)endPoint
               width:(CGFloat)width
               color:(UIColor *)color;

/**
 *  @author JyHu, 15-06-07 18:06:46
 *
 *  绘制圆角矩形
 *
 *  @param rect      圆角矩形的frame
 *  @param radius    圆角弧度
 *  @param lineWidth 线宽
 *  @param model     绘制模式
 */
- (void)drawRectangle:(CGRect)rect
           withRadius:(CGFloat)radius
            lineWidth:(CGFloat)lineWidth
     pathDrawingModel:(CGPathDrawingMode)model;

/**
 *  @author JyHu, 15-06-07 19:06:42
 *
 *  绘制圆角矩形，kCGPathFillStroke
 *
 *  @param rect        圆角矩形的frame
 *  @param radius      圆角的弧度
 *  @param lineWidth   线宽
 *  @param strokeColor 线条颜色
 *  @param fillColor   填充的内部颜色
 *  @param model       绘制模式
 */
- (void)drawRectangle:(CGRect)rect
           withRadius:(CGFloat)radius
            lineWidth:(CGFloat)lineWidth
          strokeColor:(UIColor *)strokeColor
            fillColor:(UIColor *)fillColor
     pathDrawingModel:(CGPathDrawingMode)model;


/**
 *  @author JyHu, 15-06-07 19:06:07
 *
 *  绘制多边形
 *
 *  @param pointArray 多边形各个顶点的坐标
 *  @param width      线宽
 *  @param model      绘制模式
 */
- (void)drawPolygon:(NSArray *)pointArray
          lineWidth:(CGFloat)width
   pathDrawingModel:(CGPathDrawingMode)model;

/**
 *  @author JyHu, 15-06-07 19:06:41
 *
 *  绘制多边形
 *
 *  @param pointArray  多边形各个顶点的坐标
 *  @param width       线宽
 *  @param strokeColor 线条颜色
 *  @param fillColor   内部填充颜色
 *  @param model       绘制模式
 */
- (void)drawPolygon:(NSArray *)pointArray
          lineWidth:(CGFloat)width
        strokeColor:(UIColor *)strokeColor
          fillColor:(UIColor *)fillColor
   pathDrawingModel:(CGPathDrawingMode)model;

/**
 *  @author JyHu, 15-06-08 21:06:29
 *
 *  绘制圆形
 *
 *  @param center 圆心坐标
 *  @param radius 半径
 *  @param width  线宽
 *  @param model  绘图模式
 */
- (void)drawCircleWithCenter:(CGPoint)center
                      radius:(CGFloat)radius
                   lineWidth:(CGFloat)width
            pathDrawingModel:(CGPathDrawingMode)model;

/**
 *  @author JyHu, 15-06-08 21:06:53
 *
 *  绘制圆形
 *
 *  @param center      圆心坐标
 *  @param radius      半径
 *  @param width       线宽
 *  @param fillColor   填充的内部颜色
 *  @param strokeColor 外部线条的颜色
 *  @param model       绘图的模式
 */
- (void)drawCircleWithCenter:(CGPoint)center
                      radius:(CGFloat)radius
                   lineWidth:(CGFloat)width
                   fillColor:(UIColor *)fillColor
                 strokeColor:(UIColor *)strokeColor
            pathDrawingModel:(CGPathDrawingMode)model;

/**
 *  @author JyHu, 15-06-08 21:06:48
 *
 *  绘制三次贝塞尔曲线
 *
 *  @param startPoint    开始坐标
 *  @param endPoint      结束坐标
 *  @param controlPoint1 控制点1
 *  @param controlPoint2 控制点2
 *  @param width         线宽
 *  @param model         绘制模式
 */
- (void)drawCurveFrom:(CGPoint)startPoint
                   to:(CGPoint)endPoint
        controlPoint1:(CGPoint)controlPoint1
        controlPoint2:(CGPoint)controlPoint2
            lineWidth:(CGFloat)width;

/**
 *  @author JyHu, 15-06-08 21:06:04
 *
 *  绘制三次贝塞尔曲线
 *
 *  @param startPoint    开始坐标
 *  @param endPoint      结束坐标
 *  @param controlPoint1 控制点1
 *  @param controlPoint2 控制点2
 *  @param width         线宽
 *  @param fillColor     填充颜色
 *  @param strokeColor   外部线条颜色
 *  @param model         绘制模式
 */
- (void)drawCurveFrom:(CGPoint)startPoint
                   to:(CGPoint)endPoint
        controlPoint1:(CGPoint)controlPoint1
        controlPoint2:(CGPoint)controlPoint2
            lineWidth:(CGFloat)width
                color:(UIColor *)color;

/**
 *  @author JyHu, 15-05-19 22:10:07
 *
 *  @brief  绘制二次贝塞尔曲线
 *
 *  @param startPoint   开始坐标
 *  @param endPoint     结束坐标
 *  @param controlPoint 控制点
 *  @param lineWidth    线宽
 *  @param model        绘制类型
 */
- (void)drawQuadCurveFrom:(CGPoint)startPoint
                       to:(CGPoint)endPoint
             controlPoint:(CGPoint)controlPoint
                lineWidth:(CGFloat)width;

/**
 *  @author JyHu, 15-06-08 21:06:47
 *
 *  绘制二次贝塞尔曲线
 *
 *  @param startPoint   开始坐标
 *  @param endPoint     结束坐标
 *  @param controlPoint 控制点
 *  @param width        线宽
 *  @param fillColor    填充颜色
 *  @param strokeColor  线条颜色
 *  @param model        绘制模式
 */
- (void)drawQuadCurveFrom:(CGPoint)startPoint
                       to:(CGPoint)endPoint
             controlPoint:(CGPoint)controlPoint
                lineWidth:(CGFloat)width
                    color:(UIColor *)color;

/**
 *  @author JyHu, 15-05-19 22:11:17
 *
 *  @brief  绘制弧线
 *
 *  @param center     中心坐标
 *  @param radius     半径
 *  @param startAngle 开始的弧形角度
 *  @param endAngle   结束的弧形角度
 *  @param width      线宽
 *  @param clockwise  是否是补角绘制
 */
- (void)drawArcFromCenter:(CGPoint)center
                   radius:(CGFloat)radius
               startAngle:(CGFloat)startAngle
                 endAngle:(CGFloat)endAngle
                lineWidth:(CGFloat)width
                clockWise:(BOOL)clockwise;

/**
 *  @author JyHu, 15-06-10 13:06:41
 *
 *  绘制弧线
 *
 *  @param center     中心坐标
 *  @param radius     半径
 *  @param startAngle 开始的弧形角度
 *  @param endAngle   结束的弧形角度
 *  @param width      线宽
 *  @param color      线条颜色
 *  @param clockwise  是否是补角绘制
 */
- (void)drawArcFromCenter:(CGPoint)center
                   radius:(CGFloat)radius
               startAngle:(CGFloat)startAngle
                 endAngle:(CGFloat)endAngle
                lineWidth:(CGFloat)width
                    color:(UIColor *)color
                clockWise:(BOOL)clockwise;

/**
 *  @author JyHu, 15-05-19 22:13:12
 *
 *  @brief  绘制扇形
 *
 *  @param center     中心坐标
 *  @param radius     半径
 *  @param startAngle 开始的弧形角度
 *  @param endAngle   结束的弧形角度
 *  @param clockWise  是否是补角绘制
 *  @param width      线宽
 *  @param model      绘图的方式
 */
- (void)drawSectorFromCenter:(CGPoint)center
                      radius:(CGFloat)radius
                  startAngle:(CGFloat)startAngle
                    endAngle:(CGFloat)endAngle
                   clockWise:(BOOL)clockWise
                   lineWidth:(CGFloat)width
            pathDrawingModel:(CGPathDrawingMode)model;

/**
 *  @author JyHu, 15-06-10 13:06:10
 *
 *  绘制扇形
 *
 *  @param center      中心坐标
 *  @param radius      半径
 *  @param startAngle  开始的弧形角度
 *  @param endAngle    结束的弧形角度
 *  @param clockWise   是否是补角绘制
 *  @param width       线宽
 *  @param fillColor   填充的颜色
 *  @param strokeColor 线条的颜色
 *  @param model       绘制的方式
 */
- (void)drawSectorFromCenter:(CGPoint)center
                      radius:(CGFloat)radius
                  startAngle:(CGFloat)startAngle
                    endAngle:(CGFloat)endAngle
                   clockWise:(BOOL)clockWise
                   lineWidth:(CGFloat)width
                   fillColor:(UIColor *)fillColor
                 strokeColor:(UIColor *)strokeColor
            pathDrawingModel:(CGPathDrawingMode)model;

/**
 *  @author JyHu, 15-05-19 22:15:03
 *
 *  @brief  绘制多点折线
 *
 *  @param pointArray 折线转折点坐标
 */
- (void)drawLines:(NSArray *)pointArray lineWidth:(CGFloat)width;

/**
 *  @author JyHu, 15-06-10 13:06:29
 *
 *  绘制折线
 *
 *  @param pointArray 折线上各个顶点的坐标
 *  @param width      线宽
 *  @param color      线条颜色
 */
- (void)drawLines:(NSArray *)pointArray
        lineWidth:(CGFloat)width
            color:(UIColor *)color;

/**
 *  @author JyHu, 15-06-10 13:06:18
 *
 *  绘制多边形颜色渐变
 *
 *  @param pointsArr 折线上各个顶点的坐标
 *  @param sColor    开始渐变的颜色
 *  @param eColor    结束渐变的颜色
 *  @param sLocation 开始渐变的位置
 *  @param eLocation 结束渐变的位置
 */
- (void)drawLinerGradientWithPoints:(NSArray *)pointsArr
                         startColor:(UIColor *)sColor
                           endColor:(UIColor *)eColor
                      startLocation:(AUULocation)sLocation
                        endLocation:(AUULocation)eLocation;


@end
