//
//  NodeView.m
//  Algorithms
//
//  Created by Carl Wieland on 9/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "NodeView.h"
#import "Node.h"

@implementation NodeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(id)initWithNode:(Node *)node andDirection:(NODE_DIRECTION)direction{
    UILabel* value;
    switch (direction) {
        case NODE_DIRECTION_RIGHT:
            value= [[UILabel alloc] initWithFrame:CGRectMake(0,0 , kHorizontalNodeWidth-30, kHorizontalNodeHeight)];
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

        [value.layer setBorderWidth:3];
        [value.layer setBorderColor:[UIColor blackColor].CGColor];
        [value setAdjustsFontSizeToFitWidth:YES];
        [value setAdjustsLetterSpacingToFitWidth:YES];
        [value setTextAlignment:NSTextAlignmentCenter];
        [value setText:[self.node description]];
        [self addSubview:value];
        [self.layer setBorderColor:[UIColor blackColor].CGColor];
        [self.layer setBorderWidth:3];
    }
    return self;
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
