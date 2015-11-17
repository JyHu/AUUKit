//
//  UIImage+AUUCategory.m
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "UIImage+AUUCategory.h"
#import "UIColor+AUUCategory.h"

static void addRoundedRectToPath(CGContextRef context,CGRect rect,float radius,AUUImageRoundedCorner cornerMask)
{
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y + radius);
    CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y + rect.size.height - radius);
    
    if (cornerMask & AUUImageRoundedCornerTopLeft)
    {
        CGContextAddArc(context, rect.origin.x + radius, rect.origin.y + rect.size.height - radius,radius, M_PI, M_PI /2, 1);
    }
    else
    {
        CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y + rect.size.height);
        CGContextAddLineToPoint(context, rect.origin.x + radius, rect.origin.y + rect.size.height);
    }
    
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width - radius,rect.origin.y + rect.size.height);
    
    if (cornerMask & AUUImageRoundedCornerTopRight)
    {
        CGContextAddArc(context, rect.origin.x + rect.size.width - radius,rect.origin.y + rect.size.height - radius, radius, M_PI /2, 0.0f, 1);
    }
    else
    {
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height - radius);
    }
    
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + radius);
    
    if (cornerMask & AUUImageRoundedCornerBottomRight)
    {
        CGContextAddArc(context, rect.origin.x + rect.size.width - radius, rect.origin.y + radius,radius, 0.0f, -M_PI /2, 1);
    }
    else
    {
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y);
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width - radius, rect.origin.y);
    }
    
    CGContextAddLineToPoint(context, rect.origin.x + radius, rect.origin.y);
    
    if (cornerMask & AUUImageRoundedCornerBottomLeft)
    {
        CGContextAddArc(context, rect.origin.x + radius, rect.origin.y + radius, radius,-M_PI /2, M_PI, 1);
    }
    else
    {
        CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y);
        CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y + radius);
    }
    
    CGContextClosePath(context);
}

@implementation UIImage (AUUCategory)

- (UIImage *)roundedRectWithRadius:(float)radius cornerMask:(AUUImageRoundedCorner)cornerMask
{
    UIImageView *bkImageViewTmp = [[UIImageView alloc] initWithImage:self];
    
    size_t w = (size_t)self.size.width;
    size_t h = (size_t)self.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, 2 /*kCGImageAlphaPremultipliedFirst*/);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context,bkImageViewTmp.frame, radius, cornerMask);
    CGContextClosePath(context);
    CGContextClip(context);
    
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), self.CGImage);
    
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    UIImage    *newImage = [UIImage imageWithCGImage:imageMasked];
    
    CGImageRelease(imageMasked);
    
    return newImage;
}

- (UIImage *)blurImageWithRadius:(CGFloat)radius
{
    CIImage *inputImage = [CIImage imageWithCGImage:self.CGImage];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CIFilter *clampFilter = [CIFilter filterWithName:@"CIAffineClamp"];
    [clampFilter setValue:inputImage forKey:@"inputImage"];
    [clampFilter setValue:[NSValue valueWithBytes:&transform objCType:@encode(CGAffineTransform)] forKey:@"inputTransform"];
    
    // Apply gaussian blur filter with radius of 30
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
    [gaussianBlurFilter setValue:clampFilter.outputImage forKey: @"inputImage"];
    [gaussianBlurFilter setValue:@(radius) forKey:@"inputRadius"];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:gaussianBlurFilter.outputImage fromRect:[inputImage extent]];
    
    // Set up output context.
    UIGraphicsBeginImageContext(self.size);
    CGContextRef outputContext = UIGraphicsGetCurrentContext();
    
    // Invert image coordinates
    CGContextScaleCTM(outputContext, 1.0, -1.0);
    CGContextTranslateCTM(outputContext, 0, -self.size.height);
    
    // Draw base image.
    CGContextDrawImage(outputContext, CGRectMake(0, 0, self.size.width, self.size.height), cgImage);
    
    // Apply white tint
    CGContextSaveGState(outputContext);
    CGContextSetFillColorWithColor(outputContext, [UIColor colorWithWhite:1 alpha:0.2].CGColor);
    CGContextFillRect(outputContext, CGRectMake(0, 0, self.size.width, self.size.height));
    CGContextRestoreGState(outputContext);
    
    // Output image is ready.
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [self imageWithColor:color withSize:CGSizeMake(1, 1)];
}

- (UIColor *)colorAtPixel:(CGPoint)point
{
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point))
    {
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    
    CGImageRef cgImage = self.CGImage;
    NSUInteger width = self.size.width;
    NSUInteger height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    unsigned int bytesPerpixel = 4;
    unsigned int bytesPerRow = bytesPerpixel * 1;
    
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = {0, 0, 0, 0};
    CGContextRef context = CGBitmapContextCreate(pixelData, 1, 1, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    CGContextTranslateCTM(context, -pointX, pointY - (CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    CGFloat red = (CGFloat)pixelData[0];            // 0 ~ 255.0
    CGFloat green = (CGFloat)pixelData[1];          // 0 ~ 255.0
    CGFloat blue = (CGFloat)pixelData[2];           // 0 ~ 255.0
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f; // 0 ~ 1.0
    
    return RGBA(red, green, blue, alpha);
}

#warning -
- (UIImage *)croppingInRect:(CGRect)rect
{
    return [UIImage new];
}

#warning -
- (UIImage *)imageWithMaskImage:(UIImage *)maskImage
{
    CGImageRef maskRef = maskImage.CGImage;
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef),
                                        NULL, false);
    
    CGImageRef masked = CGImageCreateWithMask([self CGImage], mask);
    
    return [UIImage imageWithCGImage:masked];
}

#warning -
- (UIImage *)scaleToSize:(CGSize)size
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    float verticalRatio = size.height * 1.0 / height;
    float horizontalRatio = size.width * 1.0 / width;
    
    float ratio = 1;
    
    if (verticalRatio > 1 && horizontalRatio > 1)
    {
        ratio = verticalRatio > horizontalRatio ? horizontalRatio : verticalRatio;
    }
    else
    {
        ratio = verticalRatio < horizontalRatio ? verticalRatio : horizontalRatio;
    }
    
    width = width *ratio;
    height = height * ratio;
    
    CGFloat xPos = (size.width - width) / 2.0;
    CGFloat yPos = (size.height - height) / 2.0;
    
    UIGraphicsBeginImageContext(size);
    
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

@end
