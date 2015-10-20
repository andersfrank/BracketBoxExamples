//
//  BAPostCell.h
//  BracketApp
//
//  Created by Anders Frank on 19/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BAPostCellModel;

@interface BAPostCell : UITableViewCell

@property (nonatomic) BAPostCellModel *viewModel;

+ (CGFloat)heightForViewModel:(BAPostCellModel *)viewModel cellWidth:(CGFloat)cellWidth;

@end
