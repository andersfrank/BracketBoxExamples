//
//  Created by Anders Frank on 2014-04-24.
//  Copyright (c) 2014 Monterosa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (BracketApp)
- (UIBezierPath *)ba_translate:(CGPoint)translation;
- (UIBezierPath *)ba_rotateAroundCenterWithAngle:(CGFloat)degrees;
- (UIBezierPath *)ba_scaleToFitSize:(CGSize)size;
- (UIBezierPath *)ba_scale:(CGFloat)scale;
- (UIBezierPath *)ba_scaleToFitSize:(CGSize)size scale:(CGFloat *)scale;
- (UIBezierPath *)ba_centerInRect:(CGRect)rect;
- (UIBezierPath *)ba_centerHorizontallyInRect:(CGRect)rect;
- (UIBezierPath *)ba_centerVerticallyInRect:(CGRect)rect;
- (UIImage *)ba_imageWithfillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor strokeWidth:(CGFloat)lineWidth imageSize:(CGSize)imageSize;
@end
