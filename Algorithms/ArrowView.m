//
//  ArrowView.m
//  Algorithms
//
//  Created by Carl Wieland on 9/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "ArrowView.h"
#import <math.h>
@implementation ArrowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView* arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right.png"]];

        UIView * separator = [[UIView alloc] initWithFrame:CGRectMake(0, (frame.size.height/2)-1, frame.size.width, 2)];
        separator.backgroundColor = [UIColor blackColor];
        [self addSubview:separator];
        [self addSubview:arrowView];
        [arrowView setFrame:CGRectMake(frame.size.width-frame.size.height, 0, frame.size.height, self.frame.size.height)];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
