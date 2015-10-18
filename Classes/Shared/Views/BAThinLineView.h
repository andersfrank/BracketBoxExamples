//
//  BAThinLineView.h
//  BracketApp
//
//  Created by Anders Frank on 09/10/15.
//  Copyright © 2015 Pakten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BAThinLineView : UIView

@property (nonatomic) UIColor *lineColor; // Default is black.
@property (nonatomic) CGRectEdge lineAligmentEdge; // Default is CGRectMaxYEdge.
@property (nonatomic) CGFloat lineThickness; // Defult is 0.5


@end
