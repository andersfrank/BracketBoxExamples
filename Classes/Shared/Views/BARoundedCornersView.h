//
//  BARoundedCornersView.h
//  BracketApp
//
//  Created by Anders Frank on 19/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BARoundedCornersView : UIView

@property (nonatomic) UIRectCorner roundedCorner;   // Default is UIRectCornerAllCorners.
@property (nonatomic) CGFloat cornerRadius;         // Default is zero.

@end
