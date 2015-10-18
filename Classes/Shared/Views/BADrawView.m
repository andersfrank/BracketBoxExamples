//
//
//  Created by Anders Frank on 2013-04-03.
//  Copyright (c) 2013 Anders Frank. All rights reserved.
//

#import "BADrawView.h"

@implementation BADrawView

- (void)setDrawBlock:(DrawBlock)drawBlock {
    _drawBlock = drawBlock;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (self.drawBlock) {
        self.drawBlock(rect);
    }
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setNeedsDisplay];
}

@end
