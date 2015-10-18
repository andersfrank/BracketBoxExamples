//
//  BAThinLineView.m
//  BracketApp
//
//  Created by Anders Frank on 09/10/15.
//  Copyright © 2015 Pakten. All rights reserved.
//

#import "BAThinLineView.h"

@implementation BAThinLineView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _lineThickness = 0.5;
        _lineColor = [UIColor blackColor];
        _lineAligmentEdge = CGRectMaxYEdge;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGRect slice, remainder;
    CGRectDivide(rect, &slice, &remainder, self.lineThickness, self.lineAligmentEdge);
    [self.lineColor setFill];
    [[UIBezierPath bezierPathWithRect:slice] fill];
}

- (void)setLineAligmentEdge:(CGRectEdge)lineAligmentEdge {
    _lineAligmentEdge = lineAligmentEdge;
    [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    [self setNeedsDisplay];
}

- (void)setLineThickness:(CGFloat)lineThickness {
    _lineThickness = lineThickness;
    [self setNeedsDisplay];
}

@end
