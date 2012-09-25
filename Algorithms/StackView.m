//
//  StackView.m
//  Algorithms
//
//  Created by Carl Wieland on 9/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "StackView.h"
#import "NodeView.h"
#import "Node.h"
#import "ArrowView.h"

@implementation StackView

-(void)addNode:(Node *)node{
    
    for (NodeView* node in self.nodeViews) {
        [node moveDown];
    }
    
    NodeView* listNode = [[NodeView alloc] initWithNode:node andDirection:NODE_DIRECTION_DOWN];
    [listNode setAlpha:0];
    [self.nodeViews addObject:listNode];
    [self setContentSize:CGSizeMake(200,([self.nodeViews count]*kVerticalMoveDistance)+40)];
    
    [self addSubview:listNode];
    
    if ([self.nodeViews count]>1) {
        ArrowView* arrow = [[ArrowView alloc] initWithFrame:CGRectMake(listNode.frame.size.width/2 -(kVerticalNodeHeight/4) , kVerticalNodeHeight,kVerticalMoveDistance-kVerticalNodeHeight +15, kVerticalNodeHeight/2) andArrowType:ARROW_TYPE_FILLED];
        [arrow.layer setAnchorPoint:CGPointMake(0, .5)];
        arrow.center = CGPointMake(listNode.frame.size.width/2, kVerticalNodeHeight-15);
        
        // Rotate 90 degrees
        CGAffineTransform rotationTransform = CGAffineTransformIdentity;
        rotationTransform = CGAffineTransformRotate(rotationTransform, M_PI_2);
        arrow.transform = rotationTransform;
        [listNode addSubview:arrow];
        
    }
    [UIView beginAnimations:@"NewNode" context:nil];
    [UIView setAnimationDelay:.2];
    [UIView setAnimationDuration:.1];
    [listNode setAlpha:1];
    [UIView commitAnimations];
    
}
-(void)removeNode{
    [[self.nodeViews lastObject] removeFromSuperview];
    [self.nodeViews removeLastObject];
    for (NodeView* node in self.nodeViews) {
        [node moveUp];
    }
}
-(NSMutableArray*)nodeViews{
    if (_nodeViews!=nil)
        return _nodeViews;
    _nodeViews=[NSMutableArray new];
    return _nodeViews;
}
-(NSMutableArray*)arrowViews{
    if (_arrowViews!=nil)
        return _arrowViews;
    _arrowViews=[NSMutableArray new];
    return _arrowViews;
}

@end
