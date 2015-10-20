//
//  UIView+NewsFeed.m
//  BracketApp
//
//  Created by Anders Frank on 19/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import "UIView+NewsFeed.h"
#import "UIView+BracketApp.h"

@implementation UIView (NewsFeed)

+ (UIView *)ba_feedItemContainerAddedToView:(UIView *)view {
    UIView *container = [UIView ba_viewWithBackgroundColor:[UIColor colorWithRed:0.980 green:0.980 blue:0.980 alpha:1] addedToView:view];
    container.layer.cornerRadius = 4;
    container.clipsToBounds = NO;
    container.layer.shouldRasterize = YES;
    container.layer.rasterizationScale = UIScreen.mainScreen.scale;
    container.layer.borderColor = [UIColor colorWithRed:0.749 green:0.761 blue:0.776 alpha:1].CGColor;
    container.layer.borderWidth = 0.5;
    container.layer.shadowColor = [UIColor blackColor].CGColor;
    container.layer.shadowOffset = CGSizeMake(0, 5);
    container.layer.shadowOpacity = 0.03;
    return container;
}

@end
