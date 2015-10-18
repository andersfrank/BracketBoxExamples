//
//  BAMuncheryViewController.m
//  BracketApp
//
//  Created by Anders Frank on 18/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import <BracketBox/BracketBox.h>
#import "BAMuncheryViewController.h"
#import "UILabel+BracketApp.h"
#import "UIButton+BracketApp.h"
#import "UIView+BracketApp.h"
#import "UIFont+BracketApp.h"

@interface BAMuncheryViewController ()

@property (nonatomic) UIScrollView *container;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIView *detailsContainer;

@end

@implementation BAMuncheryViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Munchery";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.957  green:0.969  blue:0.973 alpha:1];
    
    self.container = [UIScrollView new];
    [self.view addSubview:self.container];
    self.container.bb_node = [BBNode new];
    self.container.bb_node.childAlignment = BBChildAlignmentCenter;
    
    // Title
    {
        UILabel *titleLabel = [UILabel ba_labelWithFont:[UIFont ba_HelveticaBoldFontOfSize:13] text:@"MUNCHERY ROLL" textColor:[UIColor blackColor] addedToView:self.container];
        titleLabel.bb_node = [BBNode new];
        titleLabel.bb_node.topMargin = 24;
        
        UILabel *contentLabel = [UILabel ba_labelWithFont:[UIFont ba_HelveticaFontOfSize:13] text:@"wasabi, pickled ginger, soy sauce" textColor:[UIColor grayColor] addedToView:self.container];
        contentLabel.bb_node = [BBNode new];
        contentLabel.bb_node.topMargin = 6;
    }
    
    // Image
    {
        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"munchery_roll"]];
        [self.container addSubview:self.imageView];
        self.imageView.bb_node = [BBNode new];
        self.imageView.bb_node.height = 260;
        self.imageView.bb_node.topMargin = 15;
        self.imageView.bb_node.justification = BBJustificationFlexEnd;
        
        UILabel *favoriteLabel = [UILabel ba_labelWithFont:[UIFont ba_HelveticaFontOfSize:13] text:@"NY FAVORITE" textColor:[UIColor whiteColor] addedToView:self.imageView];
        favoriteLabel.textAlignment = NSTextAlignmentCenter;
        favoriteLabel.backgroundColor = [UIColor colorWithRed:0.404  green:0.600  blue:0.792 alpha:1];
        favoriteLabel.bb_node = [BBNode new];
        favoriteLabel.bb_node.selfAlignment = BBSelfAlignmentFlexEnd;
        favoriteLabel.bb_node.padding = BBEdgesMake(10, 35, 10, 35);
    }
    
    // Info
    {
        UIView *infoContainer = [UIView ba_clearViewAddedToView:self.container];
        infoContainer.bb_node = [BBNode new];
        infoContainer.bb_node.margin = BBEdgesMake(15, 18, 0, 18);
        infoContainer.bb_node.justification = BBJustificationSpaceBetween;
        infoContainer.bb_node.selfAlignment = BBSelfAlignmentStretch;
        infoContainer.bb_node.flexDirection = BBFlexDirectionRow;
        
        UIView *priceRatingContainer = [UIView ba_clearViewAddedToView:infoContainer];
        priceRatingContainer.bb_node = [BBNode new];
        
        UILabel *priceLabel = [UILabel ba_labelWithFont:[UIFont ba_HelveticaFontOfSize:16] text:@"$8.95" textColor:[UIColor blackColor] addedToView:priceRatingContainer];
        priceLabel.bb_node = [BBNode new];
        priceLabel.bb_node.bottomMargin = 4;
        
        UIView *ratingContainer = [UIView ba_clearViewAddedToView:priceRatingContainer];
        ratingContainer.bb_node = [BBNode new];
        ratingContainer.bb_node.flexDirection = BBFlexDirectionRow;
        
        [ratingContainer addSubview:[self.class selectedStar]];
        [ratingContainer addSubview:[self.class selectedStar]];
        [ratingContainer addSubview:[self.class selectedStar]];
        [ratingContainer addSubview:[self.class selectedStar]];
        [ratingContainer addSubview:[self.class normalStar]];
        
        UIColor *ratingsLabelTextColor = [UIColor colorWithRed:0.765  green:0.765  blue:0.741 alpha:1];
        UILabel *ratingsLabel = [UILabel ba_labelWithFont:[UIFont ba_HelveticaFontOfSize:13] text:@"(111)" textColor:ratingsLabelTextColor addedToView:ratingContainer];
        ratingsLabel.bb_node = [BBNode new];
        
        [self.class bagButtonAddedToView:infoContainer];
    }
    
    // Details
    {
        UIView *detailsContainer = [self.class detailsContainerAddedToView:self.container];
        detailsContainer.bb_node = [BBNode new];
        detailsContainer.bb_node.margin = BBEdgesMake(22, 18, 0, 18);
        detailsContainer.bb_node.padding = BBEdgesMakeUniform(17);
        self.detailsContainer = detailsContainer;
        
        [self.class detailsHeaderLabel:@"Details" addedToView:detailsContainer];
        [self.class detailsBodyLabel:@"Part of our New York Favorites menu!" addedToView:detailsContainer];
        [self.class detailsBodyLabel:[self.class descriptionSectionText] addedToView:detailsContainer];
        [self.class detailsBodyLabel:[self.class descriptionSectionText] addedToView:detailsContainer];
        [self.class detailsBodyLabel:[self.class descriptionSectionText] addedToView:detailsContainer];
        [self.class detailsBodyLabel:[self.class descriptionSectionText] addedToView:detailsContainer];
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.container.frame = self.view.bounds;
    self.imageView.bb_node.width = CGRectGetWidth(self.view.bounds) - 20;
    [self.container bb_flexLayout];
    self.container.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetMaxY(self.detailsContainer.frame) + 18);
}

+ (UIImageView *)normalStar {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_normal"]];
    imageView.bb_node = [BBNode new];
    imageView.bb_node.width = 15;
    imageView.bb_node.height = 15;
    imageView.bb_node.rightMargin = 5;
    return imageView;
}

+ (UIImageView *)selectedStar {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_selected"]];
    imageView.bb_node = [BBNode new];
    imageView.bb_node.width = 15;
    imageView.bb_node.height = 15;
    imageView.bb_node.rightMargin = 5;
    return imageView;
}

+ (UIButton *)bagButtonAddedToView:(UIView *)view {
    UIButton *button = [UIButton ba_buttonWithFont:[UIFont ba_HelveticaFontOfSize:13] titleColor:nil title:nil addedToView:view];
    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"+ Add to bag" attributes:attributes];
    [title addAttribute:NSFontAttributeName value:[UIFont ba_HelveticaBoldFontOfSize:20.0] range:NSMakeRange(0, 1)];
    [button setAttributedTitle:title forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:0.949  green:0.447  blue:0.259 alpha:1];
    button.layer.cornerRadius = 4;
    button.layer.masksToBounds = YES;
    button.bb_node = [BBNode new];
    return button;
}

+ (UIView *)detailsContainerAddedToView:(UIView *)view {
    UIView *container = [UIView ba_viewWithBackgroundColor:[UIColor whiteColor] addedToView:view];
    container.layer.cornerRadius = 4;
    container.layer.masksToBounds = YES;
    container.layer.borderColor = [UIColor colorWithRed:0.925  green:0.929  blue:0.925 alpha:1].CGColor;
    container.layer.borderWidth = 1;
    return container;
}

+ (UILabel *)detailsHeaderLabel:(NSString *)text addedToView:(UIView *)view {
    UILabel *label = [UILabel ba_labelWithFont:[UIFont ba_HelveticaFontOfSize:13] text:text textColor:[UIColor colorWithRed:0.114  green:0.125  blue:0.114 alpha:1] addedToView:view];
    label.numberOfLines = 0;
    label.bb_node = [BBNode new];
    return label;
}

+ (UILabel *)detailsBodyLabel:(NSString *)text addedToView:(UIView *)view {
    UILabel *label = [UILabel ba_labelWithFont:[UIFont ba_HelveticaFontOfSize:13] text:text textColor:[UIColor colorWithRed:0.467  green:0.471  blue:0.467 alpha:1] addedToView:view];
    label.numberOfLines = 0;
    label.bb_node = [BBNode new];
    label.bb_node.topMargin = 18;
    return label;
}

+ (NSString *)descriptionSectionText {
    return @"Our signature roll offers up three fish in each bite: yellowfin tune, Scottish salmon, and Japaneses yellowtail. Fresh cucumber adds crunch, while avocado brings creamy richness. It's all wrapped up inside nori and white rice with a dusing of red flying fish roe.";
}

@end
