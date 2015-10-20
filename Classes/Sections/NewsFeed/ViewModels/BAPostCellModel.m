//
//  BAPostCellModel.m
//  BracketApp
//
//  Created by Anders Frank on 19/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import "BAPostCellModel.h"

@implementation BAPostCellModel

- (instancetype)initWithStatus:(NSString *)status message:(NSString *)message {
    self = [super init];
    if (self) {
        _profileImage = [UIImage imageNamed:@"profile1_icon"];
        _statusLabelText = status;
        _dateLabelText = @"28 minutes ago";
        _messageLabelText = message;
    }
    return self;
}

@end
