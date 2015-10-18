//
//  UIFont+BracketApp.m
//  BracketApp
//
//  Created by Anders Frank on 04/10/15.
//  Copyright © 2015 Pakten. All rights reserved.
//

#import "UIFont+BracketApp.h"

@implementation UIFont (BracketApp)

+ (UIFont *)ba_HelveticaFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"Helvetica" size:size];
}

+ (UIFont *)ba_HelveticaBoldFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"Helvetica-Bold" size:size];
}

@end
