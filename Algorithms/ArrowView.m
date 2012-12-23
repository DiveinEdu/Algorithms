//
//  ArrowView.m
//  Algorithms
//
//  Created by Carl Wieland on 9/19/12.
//  Copyright (c) ARROW_WIDTH12 balanceoni. All rights reserved.
//

#import "ArrowView.h"
#import <QuartzCore/QuartzCore.h>
#import <math.h>
#define ARROW_WIDTH 18
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
        CGFloat len = sqrtf((x*x) + (y*y))-(offset*2);
        CGFloat angle = atan(y / x);
        

        UIImageView* arrowView=nil;
        if (start.x <= end.x) {
            arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right_filled.png"]];

            if(start.y<=end.y){
                /* down right */
                self.line = [[UIView alloc] initWithFrame:CGRectMake(offset, 0, len, 1)];
                [arrowView setFrame:CGRectMake(self.line.frame.size.width-ARROW_WIDTH+offset, self.line.frame.size.height-ARROW_WIDTH/2, ARROW_WIDTH, ARROW_WIDTH)];

            }
            else{
                /* up right*/
                self.line = [[UIView alloc] initWithFrame:CGRectMake(offset, y, len, 1)];
                [arrowView setFrame:CGRectMake(self.line.frame.size.width-ARROW_WIDTH+offset, self.line.frame.size.height-ARROW_WIDTH/2, ARROW_WIDTH, ARROW_WIDTH)];
                angle*=-1;
            }

        }
        else{
             arrowView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_left_filled.png"]];

            //going to the left
            if(start.y<=end.y){
                /*Down Left*/
                self.line = [[UIView alloc] initWithFrame:CGRectMake(offset,y, len, 1)];
                [arrowView setFrame:CGRectMake(offset, -ARROW_WIDTH/2, ARROW_WIDTH, ARROW_WIDTH)];
                angle*=-1;

            }
            else{
                /* Up Left */
                self.line = [[UIView alloc] initWithFrame:CGRectMake(offset, 0, len, 1)];
                [arrowView setFrame:CGRectMake(offset, -ARROW_WIDTH/2, ARROW_WIDTH, ARROW_WIDTH)];
                
            }
        }
        [self setAnchorPoint:CGPointMake(0, 0) forView:self.line];


        UIView* container = [[UIView alloc] initWithFrame:CGRectMake(0, self.line.frame.origin.y, len+offset, 1)];
        [container addSubview:self.line];
        [container addSubview:arrowView];
        [self.line setFrame:CGRectMake(offset, 0, self.line.frame.size.width, self.line.frame.size.height)];
        [self setAnchorPoint:CGPointMake(0, 0) forView:container];
        CGAffineTransform transform = CGAffineTransformMakeRotation(angle);
        [container setTransform:transform];

        self.line.backgroundColor = [UIColor blackColor];
        [self addSubview:container];
        [self setUserInteractionEnabled:NO];
        
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
        self.line = [[UIView alloc] initWithFrame:CGRectMake(0, 1.5, len, 3)];
        self.line.backgroundColor = [UIColor blackColor];
        [self addSubview:self.line];
        [self addSubview:arrowView];
        [arrowView setTransform:transform];
        [self.line setTransform:transform];
        
        
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andArrowType:(ARROW_TYPE)type
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView* arrowView = [[UIImageView alloc] initWithImage:[self imageForType:type]];
        
        self.line = [[UIView alloc] initWithFrame:CGRectMake(0, (frame.size.height/2)-1, frame.size.width, 2)];
        self.line.backgroundColor = [UIColor blackColor];
        [self addSubview:self.line];
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
