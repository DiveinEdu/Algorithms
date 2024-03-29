//
//  HeapView.m
//  Algorithms
//
//  Created by Carl Wieland on 9/30/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HeapView.h"
#import <QuartzCore/QuartzCore.h>
#import "HeapNode.h"
#import "ArrowView.h"

@implementation HeapView
-(id)initWithNode:(HeapNode *)node{
    return [super initWithNode:node];
}
-(void)fixLeft{
    if (self.node.left) {
        self.left = [[HeapView alloc] initWithNode:(HeapNode*)self.node.left];
        [self addSubview:self.left];
    }
}
-(void)fixRight{
    if (self.node.right) {
        self.right = [[HeapView alloc] initWithNode:(HeapNode*)self.node.right];
        [self addSubview:self.right];
    }
}
-(void)fixViews{
    for (UIView* view in [self subviews]) {
        if (view!=self.value) {
            [view removeFromSuperview];
        }
    }
    [self fixLeft];
    [self fixRight];


    
    //reset the arrows
    [self.rightArrow removeFromSuperview];
    [self.leftArrow removeFromSuperview];
    
    //calculate the space needed for both views.
    CGFloat width = (self.right != self.left) ? (self.right.frame.size.width+150+self.left.frame.size.width) : 50;
    CGFloat height = ( MAX(self.right.frame.size.height,self.left.frame.size.height) +100);
    CGSize size = CGSizeMake(width,height);
    
    self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y,size.width ,size.height);
    //update left side
    [self.left setFrame:CGRectMake(0, 100, self.left.frame.size.width, self.left.frame.size.height)];
    
    //update right side
    [self.right setFrame:CGRectMake(width - self.right.frame.size.width, 100, self.right.frame.size.width, self.right.frame.size.height)];
    
    [self.value setFrame:CGRectMake((size.width/2)-25, 0, 50, 50)];
    
    
    if (self.right) {
        //create the right arrow
        self.rightArrow = [[ArrowView alloc ]initWithStartPoint:CGPointMake(self.value.center.x, self.value.frame.size.height) andEndPoint:CGPointMake(self.right.center.x, self.right.frame.origin.y) ];
        [self addSubview:self.rightArrow];
    }
    
    if (self.left) {
       self.leftArrow = [[ArrowView alloc ]initWithStartPoint:CGPointMake(self.value.center.x, self.value.frame.size.height) andEndPoint:CGPointMake(self.left.center.x, self.left.frame.origin.y) ];
        [self addSubview:self.leftArrow];
    }
    
}

@end
