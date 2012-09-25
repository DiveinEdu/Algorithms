//
//  LinkedListView.m
//  Algorithms
//
//  Created by Carl Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "LinkedListView.h"
#import "Node.h"
#import "NodeView.h"
#import "ArrowView.h"
@implementation LinkedListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)addNode:(Node *)node{

    for (NodeView* node in self.nodeViews) {
        [node moveRight];
    }

    NodeView* listNode = [[NodeView alloc] initWithNode:node andDirection:NODE_DIRECTION_RIGHT];
    [listNode setAlpha:0];
    [self.nodeViews addObject:listNode];
    [self setContentSize:CGSizeMake(([self.nodeViews count]*kHorizontalMoveDistance)+40, 100)];

    [self addSubview:listNode];

    if ([self.nodeViews count]>1) {
        ArrowView* arrow = [[ArrowView alloc] initWithFrame:CGRectMake(listNode.frame.size.width-15, kHorizontalNodeWidth/4, kHorizontalMoveDistance-kHorizontalNodeWidth +15, kHorizontalNodeHeight/2) andArrowType:ARROW_TYPE_FILLED];
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
