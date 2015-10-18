//
//  UIButton+BracketApp.m
//  BracketApp
//
//  Created by Anders Frank on 12/10/15.
//  Copyright © 2015 Pakten. All rights reserved.
//

#import "UIButton+BracketApp.h"

@implementation UIButton (BracketApp)

+ (UIButton *)ba_buttonWithFont:(UIFont *)font titleColor:(UIColor *)titleColor title:(NSString *)title addedToView:(UIView *)superView {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    button.titleLabel.font = font;
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:title forState:UIControlStateNormal];
    [superView addSubview:button];
    return button;
}

@end
