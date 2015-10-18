//
//  UILabel+BracketApp.h
//  BracketApp
//
//  Created by Anders Frank on 09/10/15.
//  Copyright © 2015 Pakten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (BracketApp)

+ (UILabel *)ba_labelWithFont:(UIFont *)font text:(NSString *)text textColor:(UIColor *)textColor addedToView:(UIView *)superView;

@end
