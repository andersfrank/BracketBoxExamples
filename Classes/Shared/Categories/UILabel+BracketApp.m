//
//  UILabel+BracketApp.m
//  BracketApp
//
//  Created by Anders Frank on 09/10/15.
//  Copyright © 2015 Pakten. All rights reserved.
//

#import "UILabel+BracketApp.h"

@implementation UILabel (BracketApp)

+ (UILabel *)ba_labelWithFont:(UIFont *)font text:(NSString *)text textColor:(UIColor *)textColor addedToView:(UIView *)superView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = font;
    label.text = text;
    label.textColor = textColor;
    label.backgroundColor = [UIColor clearColor];
    [superView addSubview:label];
    return label;
}

@end
