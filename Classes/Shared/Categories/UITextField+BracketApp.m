//
//  UITextField+BracketApp.m
//  BracketApp
//
//  Created by Anders Frank on 12/10/15.
//  Copyright © 2015 Pakten. All rights reserved.
//

#import "UITextField+BracketApp.h"

@implementation UITextField (BracketApp)

+ (UITextField *)ba_textFieldWithFont:(UIFont *)font textColor:(UIColor *)textColor addedToView:(UIView *)superView {
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectZero];
    textField.font = font;
    textField.textColor = textColor;
    textField.backgroundColor = [UIColor clearColor];
    [superView addSubview:textField];
    return textField;
}

@end
