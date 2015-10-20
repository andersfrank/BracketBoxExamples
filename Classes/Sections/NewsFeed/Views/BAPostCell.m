//
//  BAPostCell.m
//  BracketApp
//
//  Created by Anders Frank on 19/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import <BracketBox/BracketBox.h>

#import "BAPostCell.h"
#import "UILabel+BracketApp.h"
#import "UIFont+BracketApp.h"
#import "UIView+BracketApp.h"
#import "UIView+NewsFeed.h"
#import "BAPostCellModel.h"
#import "BAThinLineView.h"
#import "BARoundedCornersView.h"

@interface BAPostCell ()

@property (nonatomic) UIView *container;
@property (nonatomic) UILabel *statusLabel;
@property (nonatomic) UILabel *dateLabel;
@property (nonatomic) UILabel *messageLabel;
@property (nonatomic) UIImageView *profileImageView;

@end

@implementation BAPostCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.contentView.bb_node = [BBNode new];
        self.contentView.bb_node.leftPadding = 9;
        self.contentView.bb_node.rightPadding = 9;
        
        self.container = [UIView ba_feedItemContainerAddedToView:self.contentView];
        self.container.bb_node = [BBNode new];
        self.container.bb_node.childAlignment = BBChildAlignmentStretch;
        self.container.bb_node.bottomMargin = 13;
        self.container.bb_node.flex = 1;

        BARoundedCornersView *whiteContainer = [self.class whiteContainerAddedToView:self.container];
        whiteContainer.bb_node = [BBNode new];

        // Top
        {
            UIView *horizontalContainer = [UIView ba_clearViewAddedToView:whiteContainer];
            horizontalContainer.clipsToBounds = NO;
            horizontalContainer.bb_node = [BBNode new];
            horizontalContainer.bb_node.flexDirection = BBFlexDirectionRow;
            horizontalContainer.bb_node.justification = BBJustificationSpaceBetween;
            horizontalContainer.bb_node.leftMargin = 10;
            horizontalContainer.bb_node.topMargin = 10;
        
            self.profileImageView = [UIImageView new];
            [horizontalContainer addSubview:self.profileImageView];
            self.profileImageView.bb_node = [BBNode new];
            self.profileImageView.bb_node.width = 34;
            self.profileImageView.bb_node.height = 34;
            self.profileImageView.bb_node.rightMargin = 7;
            
            // Labels
            {
                UIView *labelsContainer = [UIView ba_clearViewAddedToView:horizontalContainer];
                labelsContainer.bb_node = [BBNode new];
                labelsContainer.bb_node.flex = 1;
                
                self.statusLabel = [self.class b1LabelAddedToView:labelsContainer];
                self.statusLabel.numberOfLines = 0;
                self.statusLabel.bb_node = [BBNode new];
                
                UIView *timeContainer = [UIView ba_clearViewAddedToView:labelsContainer];
                timeContainer.bb_node = [BBNode new];
                timeContainer.bb_node.flexDirection = BBFlexDirectionRow;
                timeContainer.bb_node.childAlignment = BBChildAlignmentCenter;
                timeContainer.bb_node.topMargin = 4;
                
                self.dateLabel = [self.class b2LabelAddedToView:timeContainer];
                self.dateLabel.bb_node = [BBNode new];
                
                UIImageView *personsIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"persons_icon"]];
                [timeContainer addSubview:personsIcon];
                personsIcon.bb_node = [BBNode new];
                personsIcon.bb_node.width = 8;
                personsIcon.bb_node.height = 8;
                personsIcon.bb_node.leftMargin = 6;
            }
            
            UIButton *arrowButton = [self.class arrowButtonAddedToView:horizontalContainer];
            arrowButton.bb_node = [BBNode new];
            arrowButton.bb_node.padding = BBEdgesMakeUniform(10);
            arrowButton.bb_node.topMargin = -13;
        }
        
        // Message
        {
            self.messageLabel = [self.class b1LabelAddedToView:whiteContainer];
            self.messageLabel.numberOfLines = 0;
            self.messageLabel.bb_node = [BBNode new];
            self.messageLabel.bb_node.margin = BBEdgesMake(15, 10, 0, 10);
        }
        
        // Likes
        {
            UILabel *likesLabel = [self.class b2LabelAddedToView:whiteContainer];
            likesLabel.text = @"2 Likes";
            likesLabel.bb_node = [BBNode new];
            likesLabel.bb_node.margin = BBEdgesMake(12, 10, 15, 10);
        }
        
        // Thin line
        {
            BAThinLineView *thinLineView = [self.class thinLineAddedToView:self.container];
            thinLineView.bb_node = [BBNode new];
            thinLineView.bb_node.height = 1;
        }
        
        // Toolbar
        {
            UIView *buttonsContainer = [UIView ba_clearViewAddedToView:self.container];
            buttonsContainer.bb_node = [BBNode new];
            buttonsContainer.bb_node.justification = BBJustificationSpaceBetween;
            buttonsContainer.bb_node.flexDirection = BBFlexDirectionRow;
            buttonsContainer.bb_node.height = 38;
            buttonsContainer.bb_node.leftPadding = 20;
            buttonsContainer.bb_node.rightPadding = 20;
            [self.class actionButton:@"Like" image:[UIImage imageNamed:@"like_icon"] addedToView:buttonsContainer];
            [self.class actionButton:@"Comment" image:[UIImage imageNamed:@"comment_icon"] addedToView:buttonsContainer];
            [self.class actionButton:@"Share" image:[UIImage imageNamed:@"share_icon"] addedToView:buttonsContainer];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.bb_node.width = CGRectGetWidth(self.contentView.bounds);
    [self.contentView bb_flexLayout];
}

- (void)setViewModel:(BAPostCellModel *)viewModel {
    _viewModel = viewModel;
    self.statusLabel.text = viewModel.statusLabelText;
    self.dateLabel.text = viewModel.dateLabelText;
    self.messageLabel.text = viewModel.messageLabelText;
    self.profileImageView.image = viewModel.profileImage;
    [self setNeedsLayout];
}

+ (BARoundedCornersView *)whiteContainerAddedToView:(UIView *)view {
    BARoundedCornersView *container = [BARoundedCornersView new];
    [view addSubview:container];
    container.roundedCorner = UIRectCornerTopLeft | UIRectCornerTopRight;
    container.cornerRadius = 4;
    container.backgroundColor = [UIColor whiteColor];
    return container;
}

+ (UILabel *)b1LabelAddedToView:(UIView *)view {
    return [UILabel ba_labelWithFont:[UIFont ba_HelveticaFontOfSize:11] text:nil textColor:[UIColor blackColor] addedToView:view];
}

+ (UILabel *)b2LabelAddedToView:(UIView *)view {
    return [UILabel ba_labelWithFont:[UIFont ba_HelveticaFontOfSize:10] text:nil textColor:[UIColor grayColor] addedToView:view];
}

+ (UIButton *)arrowButtonAddedToView:(UIView *)view {
    UIButton *button = [UIButton new];
    [view addSubview:button];
    [button setImage:[UIImage imageNamed:@"down_arrow"] forState:UIControlStateNormal];
    return button;
}

+ (UIButton *)actionButton:(NSString *)title image:(UIImage *)image addedToView:(UIView *)view {
    UIButton *button = [UIButton new];
    [view addSubview:button];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.506 green:0.518 blue:0.545 alpha:1] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont ba_HelveticaBoldFontOfSize:10];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, -6);
    button.backgroundColor = [UIColor clearColor];
    button.bb_node = [BBNode new];
    button.bb_node.rightMargin = 6;
    return button;
}

+ (BAThinLineView *)thinLineAddedToView:(UIView *)view {
    BAThinLineView *thinLine = [BAThinLineView new];
    thinLine.lineAligmentEdge = CGRectMinYEdge;
    [view addSubview:thinLine];
    thinLine.lineColor = [UIColor colorWithRed:0.941 green:0.941 blue:0.941 alpha:1];
    return thinLine;
}

+ (CGFloat)heightForViewModel:(BAPostCellModel *)viewModel cellWidth:(CGFloat)cellWidth {
    BAPostCell *cell = [self templateCell];
    cell.viewModel = viewModel;
    cell.contentView.bb_node.width = cellWidth;
    [cell.contentView bb_flexLayout];
    return CGRectGetHeight(cell.contentView.bounds);
}

// Used for height calculations.
+ (instancetype)templateCell {
    static BAPostCell *cell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    });
    return cell;
}



@end
