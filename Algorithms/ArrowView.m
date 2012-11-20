//
//  ArrowView.m
//  Algorithms
//
//  Created by Carl Wieland on 9/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "ArrowView.h"
#import <QuartzCore/QuartzCore.h>
#import <math.h>
@interface ArrowView()
-(UIImage*)imageForType:(ARROW_TYPE) type;
@end

@implementation ArrowView
-(id)initWithStartPoint:(CGPoint)start andEndPoint:(CGPoint)end{
    return [self initWithStartPoint:start andEndPoint:end withOffset:0];
}

-(id)initWithStartPoint:(CGPoint)start andEndPoint:(CGPoint)end withOffset:(NSInteger)offset{
    CGFloat leftX = MIN(start.x, end.x);
    CGFloat leftY = MIN(start.y, end.y);
    
    
    CGRect frame = CGRectMake(leftX, leftY, MAX(abs(end.x-start.x),10), MAX(abs(end.y-start.y),10));

    self = [super initWithFrame:frame];
    if(self){
        CGFloat x = self.frame.size.width;
        CGFloat y = self.frame.size.height;
        CGFloat len = sqrtf((x*x) + (y*y))-offset;
        CGFloat angle = atan(y / x);
        
        UIView * separator = nil;
        UIImageView* arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right_filled.png"]];

        if (start.x <= end.x) {
            if(start.y<=end.y){
                //we are going down to the right
                /*
                 *___
                 |\  |
                 |_\_|
                 */
                separator = [[UIView alloc] initWithFrame:CGRectMake(0, 0, len, 1)];
                [self setAnchorPoint:CGPointMake(0, 0) forView:separator];
                [arrowView setFrame:CGRectMake(frame.size.width-10, frame.size.height-5, 10, 10)];
                [separator addSubview:arrowView];
                [arrowView setFrame:CGRectMake(len-10, -10, 10, 10)];
                CGAffineTransform arrow = CGAffineTransformMakeRotation(angle);
                [arrowView setTransform:arrow];
                CGAffineTransform transform = CGAffineTransformMakeRotation(angle);
                [separator setTransform:transform];
            }
            else{
                //we are going up to the right
                /*
                 ___
                 | /|
                 |/_|
                 *
                 */
                separator = [[UIView alloc] initWithFrame:CGRectMake(0, y, len, 1)];
                [self setAnchorPoint:CGPointMake(0, 0) forView:separator];
                [arrowView setFrame:CGRectMake(frame.size.width-10, frame.size.height-5, 10, 10)];
                [self setAnchorPoint:CGPointMake(1, .5) forView:arrowView];
                CGAffineTransform arrow = CGAffineTransformMakeRotation(-angle);
                [arrowView setTransform:arrow];
                CGAffineTransform transform = CGAffineTransformMakeRotation(-angle);
                [separator setTransform:transform];
            }

        }
        else{
            //going to the left
            if(start.y<=end.y){
                /*__*
                 | /|
                 |/_|
                 */
                separator = [[UIView alloc] initWithFrame:CGRectMake(0,y, len, 1)];
                [self setAnchorPoint:CGPointMake(0, 0) forView:separator];
                [arrowView setFrame:CGRectMake(-10, frame.size.height-5, 10, 10)];
                [self setAnchorPoint:CGPointMake(1, .5) forView:arrowView];
                CGAffineTransform arrow = CGAffineTransformMakeRotation(-(M_PI+angle));
                [arrowView setTransform:arrow];
                CGAffineTransform transform = CGAffineTransformMakeRotation(-angle);
                [separator setTransform:transform];
            }
            else{
                /*
                 ____
                 |\ |
                 |_\|*
                 Up Left
                 */
                separator = [[UIView alloc] initWithFrame:CGRectMake(0, 0, len, 1)];
                [self setAnchorPoint:CGPointMake(0, 0) forView:separator];
                [arrowView setFrame:CGRectMake(frame.size.width-10, frame.size.height-5, 10, 10)];
                [separator addSubview:arrowView];
                [arrowView setFrame:CGRectMake(len-10, -10, 10, 10)];
                CGAffineTransform arrow = CGAffineTransformMakeRotation(angle);
                [arrowView setTransform:arrow];
                CGAffineTransform transform = CGAffineTransformMakeRotation(angle);
                [separator setTransform:transform];

                
            }



        }
        
        separator.backgroundColor = [UIColor blackColor];
        [self addSubview:separator];


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

        UIView * separator = [[UIView alloc] initWithFrame:CGRectMake(0, 1.5, len, 3)];
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


-(void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    CGPoint newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y);
    CGPoint oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);
    
    CGPoint position = view.layer.position;
    
    position.x -= oldPoint.x;
    position.x += newPoint.x;
    
    position.y -= oldPoint.y;
    position.y += newPoint.y;
    
    view.layer.position = position;
    view.layer.anchorPoint = anchorPoint;
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
