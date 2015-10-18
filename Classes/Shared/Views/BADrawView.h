//
//
//  Created by Anders Frank on 2013-04-03.
//  Copyright (c) 2013 Anders Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DrawBlock)(CGRect frame);

@interface BADrawView : UIView

@property (nonatomic, copy) DrawBlock drawBlock;

@end
