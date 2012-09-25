//
//  DoublyLinkedListView.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DoublyLinkedListView.h"
#import "ListNode.h"
#import "NodeView.h"
#import "ArrowView.h"
@implementation DoublyLinkedListView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)addNode:(ListNode *)node{
    
    for (NodeView* node in self.nodeViews) {
        [node moveRight];
    }
    
    NodeView* listNode = [[NodeView alloc] initWithNode:node andDirection:NODE_DIRECTION_RIGHT];
    [listNode setAlpha:0];
    [self.nodeViews addObject:listNode];
    [self setContentSize:CGSizeMake(([self.nodeViews count]*kHorizontalMoveDistance)+40, 100)];
    
    [self addSubview:listNode];
    
    if ([self.nodeViews count]>1) {
        ArrowView* next = [[ArrowView alloc] initWithFrame:CGRectMake(listNode.frame.size.width-15, kHorizontalNodeHeight/6, kHorizontalMoveDistance-kHorizontalNodeWidth +15, kHorizontalNodeHeight/3) andArrowType:ARROW_TYPE_FILLED];
        
        ArrowView* prev = [[ArrowView alloc] initWithFrame:CGRectMake(listNode.frame.size.width-20, kHorizontalNodeHeight/2, kHorizontalMoveDistance-kHorizontalNodeWidth +20, kHorizontalNodeHeight/3) andArrowType:ARROW_TYPE_FILLED];
        [prev.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
        
        // Rotate 90 degrees
        CGAffineTransform rotationTransform = CGAffineTransformIdentity;
        rotationTransform = CGAffineTransformRotate(rotationTransform, M_PI);
        prev.transform = rotationTransform;
        
        [listNode addSubview:next];
        [listNode addSubview:prev];
        
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
        [node moveLeft];
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
