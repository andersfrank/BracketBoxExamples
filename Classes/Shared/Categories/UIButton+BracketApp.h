//
//  UIButton+BracketApp.h
//  BracketApp
//
//  Created by Anders Frank on 12/10/15.
//  Copyright © 2015 Pakten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BracketApp)

+ (UIButton *)ba_buttonWithFont:(UIFont *)font titleColor:(UIColor *)titleColor title:(NSString *)title addedToView:(UIView *)superView;

@end
