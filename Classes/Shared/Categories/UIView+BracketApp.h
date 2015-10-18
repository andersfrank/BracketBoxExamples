//
//  UIView+BracketApp.h
//  BracketApp
//
//  Created by Anders Frank on 09/10/15.
//  Copyright © 2015 Pakten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BracketApp)

+ (UIView *)ba_viewWithBackgroundColor:(UIColor *)backgroundColor addedToView:(UIView *)superView;
+ (UIView *)ba_clearViewAddedToView:(UIView *)superView;

@end
