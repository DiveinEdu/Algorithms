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
-(id)initWithStartPoint:(CGPoint)start andEndPoint:(CGPoint)end{
    NSLog(@"%f %f to %f %f",start.x, start.y, end.x, end.y);
    CGRect frame = CGRectMake(0, 0, MAX(end.x-start.x,10), MAX(end.y-start.y,10));
    NSLog(@"%f %f %f %f ",frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    self = [super initWithFrame:frame];
    if(self){
        CGFloat x = MAX(end.x - start.x,10);
        CGFloat y = MAX(end.y - start.y,10);
        CGFloat angle = atan(y / x);
        CGAffineTransform transform = CGAffineTransformMakeRotation(angle);

        UIImageView* arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right_filled.png"]];
        [arrowView setFrame:CGRectMake(x, y, 10, 10)];
        [arrowView setTransform:transform];
        
        [self addSubview:arrowView];
    }
    return self;
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGPoint startPoint = CGPointMake(frame.origin.x,frame.origin.y);
        CGPoint endPoint = CGPointMake(frame.size.width,frame.size.height);
        CGFloat x = endPoint.x - startPoint.x;
        CGFloat y = endPoint.y - startPoint.y;
        CGFloat len = sqrtf((x*x) + (y*y));
        CGFloat angle = atan(y / x);
        CGAffineTransform transform = CGAffineTransformMakeRotation(angle);
        
        
        UIImageView* arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right_filled.png"]];

        UIView * separator = [[UIView alloc] initWithFrame:CGRectMake(0, 0, len, 1)];
        separator.backgroundColor = [UIColor blackColor];
        [self addSubview:separator];
        [self addSubview:arrowView];
        [arrowView setTransform:transform];
        [separator setTransform:transform];
       // [arrowView setFrame:CGRectMake(arrowView.frame.size.width-frame.size.height, frame.size.height, frame.size.height, frame.size.height)];
        //[separator setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        

        
        
        
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
