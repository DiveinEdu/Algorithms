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


@end
