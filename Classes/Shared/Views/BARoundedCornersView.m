//
//  BARoundedCornersView.m
//  BracketApp
//
//  Created by Anders Frank on 19/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import "BARoundedCornersView.h"

@interface BARoundedCornersView ()

@property (nonatomic) UIColor *contentColor;

@end

@implementation BARoundedCornersView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.roundedCorner = UIRectCornerAllCorners;
        super.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:self.roundedCorner cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
    [self.contentColor setFill];
    [path fill];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.contentColor = backgroundColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self setNeedsDisplay];
}

- (void)setRoundedCorner:(UIRectCorner)roundedCorner {
    _roundedCorner = roundedCorner;
    [self setNeedsDisplay];
}

@end
