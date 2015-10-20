//
//  BANewsFeedCell.m
//  BracketApp
//
//  Created by Anders Frank on 19/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import <BracketBox/BracketBox.h>

#import "BANewsFeedCell.h"

#import "UIView+BracketApp.h"
#import "UILabel+BracketApp.h"
#import "UIFont+BracketApp.h"
#import "UIView+NewsFeed.h"

@interface BANewsFeedCell ()

@property (nonatomic) UIView *container;

@end

@implementation BANewsFeedCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
        
        self.contentView.bb_node = [BBNode new];
        self.contentView.bb_node.leftPadding = 9;
        self.contentView.bb_node.rightPadding = 9;
        
        self.container = [UIView ba_feedItemContainerAddedToView:self.contentView];
        self.container.bb_node = [BBNode new];
        self.container.bb_node.flexDirection = BBFlexDirectionRow;
        self.container.bb_node.height = 45;
        self.container.bb_node.childAlignment = BBChildAlignmentCenter;
        
        UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"news_feed_icon"]];
        [self.container addSubview:icon];
        icon.bb_node = [BBNode new];
        icon.bb_node.width = 15;
        icon.bb_node.height = 12;
        icon.bb_node.leftMargin = 10;
        
        UILabel *label = [UILabel ba_labelWithFont:[UIFont ba_HelveticaBoldFontOfSize:14] text:@"News Feed" textColor:[UIColor blackColor] addedToView:self.container];
        label.bb_node = [BBNode new];
        label.bb_node.leftMargin = 10;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.bb_node.size = self.contentView.bounds.size;
    [self.contentView bb_flexLayout];
}

@end
