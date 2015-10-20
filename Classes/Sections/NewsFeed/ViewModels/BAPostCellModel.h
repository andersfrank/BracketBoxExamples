//
//  BAPostCellModel.h
//  BracketApp
//
//  Created by Anders Frank on 19/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BAPostCellModel : NSObject

- (instancetype)initWithStatus:(NSString *)status message:(NSString *)message;

@property (nonatomic, readonly) UIImage *profileImage;
@property (nonatomic, readonly) NSString *statusLabelText;
@property (nonatomic, readonly) NSString *dateLabelText;
@property (nonatomic, readonly) NSString *messageLabelText;

@end
