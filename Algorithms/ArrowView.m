//
//  ArrowView.m
//  Algorithms
//
//  Created by Carl Wieland on 9/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "ArrowView.h"
#import <math.h>
@interface ArrowView()
-(UIImage*)imageForType:(ARROW_TYPE) type;
@end

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

- (id)initWithFrame:(CGRect)frame andArrowType:(ARROW_TYPE)type
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView* arrowView = [[UIImageView alloc] initWithImage:[self imageForType:type]];
        
        UIView * separator = [[UIView alloc] initWithFrame:CGRectMake(0, (frame.size.height/2)-1, frame.size.width, 2)];
        separator.backgroundColor = [UIColor blackColor];
        [self addSubview:separator];
        [self addSubview:arrowView];
        [arrowView setFrame:CGRectMake(frame.size.width-frame.size.height, 0, frame.size.height, self.frame.size.height)];
    }
    return self;
}


-(UIImage*)imageForType:(ARROW_TYPE) type{
    switch (type) {
        case ARROW_TYPE_FILLED:
            return [UIImage imageNamed:@"arrow_right_filled.png"];
        case ARROW_TYPE_EMPTY:
            return [UIImage imageNamed:@"arrow_right.png"];
        default:
            return [UIImage imageNamed:@"arrow_right.png"];
    }
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
