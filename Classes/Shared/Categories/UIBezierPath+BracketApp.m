//
//  Created by Anders Frank on 2014-04-24.
//  Copyright (c) 2014 Monterosa. All rights reserved.
//

#import "UIBezierPath+BracketApp.h"

@implementation UIBezierPath (BracketApp)

- (UIImage *)ba_imageWithfillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor strokeWidth:(CGFloat)lineWidth imageSize:(CGSize)imageSize {

    if (CGSizeEqualToSize(CGSizeZero, self.bounds.size)) {
        return nil;
    }
    
    UIBezierPath *path = self;
    if (strokeColor) {
        path = [path ba_centerInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    }
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    
    if (fillColor) {
        [fillColor setFill];
        [path fill];
    }
    
    if (strokeColor) {
        [strokeColor setStroke];
        path.lineWidth = lineWidth;
        
        [path stroke];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIBezierPath *)ba_translate:(CGPoint)translation {
    CGAffineTransform transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
    CGPathRef cgpath = CGPathCreateCopyByTransformingPath(self.CGPath, &transform);
    UIBezierPath *bpath = [UIBezierPath bezierPathWithCGPath:cgpath];
    CGPathRelease(cgpath);
    return bpath;
}

- (UIBezierPath *)ba_rotateAroundCenterWithAngle:(CGFloat)degrees {
    CGFloat radians = degrees * M_PI / 180;
    CGRect bounds = CGPathGetBoundingBox(self.CGPath);
    CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformTranslate(transform, center.x, center.y);
    transform = CGAffineTransformRotate(transform, radians);
    transform = CGAffineTransformTranslate(transform, -center.x, -center.y);
    CGPathRef path = CGPathCreateCopyByTransformingPath(self.CGPath, &transform);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithCGPath:path];
    CGPathRelease(path);
    return bezierPath;
}

- (UIBezierPath *)ba_scaleToFitSize:(CGSize)size scale:(CGFloat *)scale {
    if (size.width == 0 || size.height == 0) {
        return nil;
    }
    CGFloat xScale =  size.width / self.bounds.size.width;
    CGFloat yScale =  size.height / self.bounds.size.height;
    CGFloat s = MIN(xScale,yScale);
    CGAffineTransform transform = CGAffineTransformMakeScale(s,s);
    CGPathRef cgpath = CGPathCreateCopyByTransformingPath(self.CGPath, &transform);
    UIBezierPath *bpath = [UIBezierPath bezierPathWithCGPath:cgpath];
    CGPathRelease(cgpath);
    *scale = s;
    return bpath;
}

- (UIBezierPath *)ba_scaleToFitSize:(CGSize)size; {
    CGFloat scale;
    return [self ba_scaleToFitSize:size scale:&scale];
}

- (UIBezierPath *)ba_scale:(CGFloat)scale {
    CGAffineTransform transform = CGAffineTransformMakeScale(scale,scale);
    CGPathRef cgpath = CGPathCreateCopyByTransformingPath(self.CGPath, &transform);
    UIBezierPath *bpath = [UIBezierPath bezierPathWithCGPath:cgpath];
    CGPathRelease(cgpath);
    return bpath;
}

- (UIBezierPath *)ba_centerInRect:(CGRect)rect {
    CGPoint translation;
    translation.x = roundf(rect.origin.x + (rect.size.width - CGRectGetWidth(self.bounds)) / 2);
    translation.y = roundf(rect.origin.y + (rect.size.height - CGRectGetHeight(self.bounds)) / 2);
    return [self ba_translate:translation];
}

- (UIBezierPath *)ba_centerHorizontallyInRect:(CGRect)rect {
    CGPoint translation;
    translation.x = roundf(rect.origin.x + (rect.size.width - CGRectGetWidth(self.bounds)) / 2);
    translation.y = 0;
    return [self ba_translate:translation];
}

- (UIBezierPath *)ba_centerVerticallyInRect:(CGRect)rect {
    CGPoint translation;
    translation.x = 0;
    translation.y = roundf(rect.origin.y + (rect.size.height - CGRectGetHeight(self.bounds)) / 2);
    return [self ba_translate:translation];
}

@end
