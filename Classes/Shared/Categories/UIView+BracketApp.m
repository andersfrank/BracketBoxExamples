//
//  UIView+BracketApp.m
//  BracketApp
//
//  Created by Anders Frank on 09/10/15.
//  Copyright © 2015 Pakten. All rights reserved.
//

#import "UIView+BracketApp.h"

@implementation UIView (BracketApp)

+ (UIView *)ba_viewWithBackgroundColor:(UIColor *)backgroundColor addedToView:(UIView *)superView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = backgroundColor;
    [superView addSubview:view];
    return view;
}

+ (UIView *)ba_clearViewAddedToView:(UIView *)superView {
    return [self ba_viewWithBackgroundColor:[UIColor clearColor] addedToView:superView];
}

@end
