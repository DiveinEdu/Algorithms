//
//  LinkedListView.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "LinkedListView.h"
#import "Node.h"
#import "ListNodeView.h"
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
    ListNodeView* listNode = [[ListNodeView alloc] initWithNode:node];
    for (ListNodeView* node in self.nodeViews) {
        [node moveRight];
    }
    [self.nodeViews addObject:listNode];
    [self setContentSize:CGSizeMake([self.nodeViews count]*([listNode frame].size.width+100), 100)];
    [self addSubview:listNode];

}
-(void)removeNode{
    [[self.nodeViews lastObject] removeFromSuperview];
    [self.nodeViews removeLastObject];
    for (ListNodeView* node in self.nodeViews) {
        [node moveLeft];
    }
}
-(NSMutableArray*)nodeViews{
    if (_nodeViews!=nil)
        return _nodeViews;
    _nodeViews=[NSMutableArray new];
    return _nodeViews;

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
