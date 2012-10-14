//
//  NodeView.m
//  Algorithms
//
//  Created by Carl Wieland on 9/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "NodeView.h"
#import "ListNode.h"
#import "ArrowView.h"

@implementation NodeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(id)initWithNode:(ListNode *)node andDirection:(NODE_DIRECTION)direction{
    UILabel* value;
    switch (direction) {
        case NODE_DIRECTION_RIGHT:
            value= [[UILabel alloc] initWithFrame:CGRectMake(0,0 , kHorizontalNodeWidth-30, kHorizontalNodeHeight)];
            self = [super initWithFrame:CGRectMake(0, 0, kHorizontalNodeWidth, kHorizontalNodeHeight)];

            break;
        case NODE_DIRECTION_DOWN:
            value= [[UILabel alloc] initWithFrame:CGRectMake(0,0, kVerticalNodeWidth, kVerticalNodeHeight-30)];
            self = [super initWithFrame:CGRectMake(0, 0, kVerticalNodeWidth, kVerticalNodeHeight )];

            break;
            
        default:
            value= [[UILabel alloc] initWithFrame:CGRectMake(0,0 , kHorizontalNodeWidth-30, kHorizontalNodeHeight)];
            self = [super initWithFrame:CGRectMake(0, 0, kHorizontalNodeWidth, kHorizontalNodeHeight)];

            break;
    }
    self.node=node;

    if(self){
        self.container = [[UIView alloc] initWithFrame:self.frame];
        [value.layer setBorderWidth:3];
        [value.layer setBorderColor:[UIColor blackColor].CGColor];
        [value setAdjustsFontSizeToFitWidth:YES];
        [value setAdjustsLetterSpacingToFitWidth:YES];
        [value setTextAlignment:NSTextAlignmentCenter];
        [value setText:[self.node description]];
        [self.container addSubview:value];
        [self.container.layer setBorderColor:[UIColor blackColor].CGColor];
        [self.container.layer setBorderWidth:3];
        [self addSubview:self.container];
        [self fixViews:direction];
    }
    return self;
}
-(void)fixViews:(NODE_DIRECTION)direction{
    if(self.node.next){
        NodeView* next = [[NodeView alloc] initWithNode:self.node.next andDirection:direction];
        [self addSubview:next];

        [next setFrame:CGRectMake(kHorizontalMoveDistance, 0, next.frame.size.width, next.frame.size.height)];
        
        ArrowView* arrow = [[ArrowView alloc] initWithFrame:CGRectMake(self.frame.size.width-15, kHorizontalNodeHeight/4, kHorizontalMoveDistance-kHorizontalNodeWidth +15, kHorizontalNodeHeight/3) andArrowType:ARROW_TYPE_FILLED];
        [self addSubview:arrow];
        if (self.node.next.previous) {
            ArrowView* prev = [[ArrowView alloc] initWithFrame:CGRectMake(self.container.frame.size.width-20, kHorizontalNodeHeight/2, kHorizontalMoveDistance-kHorizontalNodeWidth +20, kHorizontalNodeHeight/3) andArrowType:ARROW_TYPE_FILLED];
            [prev.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
            
            // Rotate 90 degrees
            CGAffineTransform rotationTransform = CGAffineTransformIdentity;
            rotationTransform = CGAffineTransformRotate(rotationTransform, M_PI);
            prev.transform = rotationTransform;
            [self addSubview:prev];
        }

        
        [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width+next.frame.size.width+kHorizontalMoveDistance-25, self.frame.size.height)];
        
        
    }

}
-(void)moveRight{
    [UIView beginAnimations:@"MoveRight" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.15f];
    self.frame = CGRectMake(self.frame.origin.x+kHorizontalMoveDistance, self.frame.origin.y,self.frame.size.width , self.frame.size.height);
    [UIView commitAnimations];
}
-(void)moveLeft{
    [UIView beginAnimations:@"MoveLeft" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.15f];
    self.frame = CGRectMake(self.frame.origin.x-kHorizontalMoveDistance, self.frame.origin.y,self.frame.size.width , self.frame.size.height);
    [UIView commitAnimations];
}

-(void)moveDown{
    
    [UIView beginAnimations:@"MoveDown" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.15f];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y+kVerticalMoveDistance,self.frame.size.width , self.frame.size.height);
    [UIView commitAnimations];
}
-(void)moveUp{
    [UIView beginAnimations:@"MoveUp" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.15f];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y-kVerticalMoveDistance,self.frame.size.width , self.frame.size.height);
    [UIView commitAnimations];
}

@end
