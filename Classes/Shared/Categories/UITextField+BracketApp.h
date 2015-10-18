//
//  UITextField+BracketApp.h
//  BracketApp
//
//  Created by Anders Frank on 12/10/15.
//  Copyright © 2015 Pakten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (BracketApp)

+ (UITextField *)ba_textFieldWithFont:(UIFont *)font textColor:(UIColor *)textColor addedToView:(UIView *)superView;

@end
