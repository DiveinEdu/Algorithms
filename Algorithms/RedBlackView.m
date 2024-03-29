//
//  RedBlackView.m
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "RedBlackView.h"
#import <QuartzCore/QuartzCore.h>
#import "RedBlackNode.h"

@implementation RedBlackView
-(id)initWithNode:(RedBlackNode *)node{
    return [super initWithNode:node];
}
-(void)fixLeft{
    if (self.node.left) {
        self.left = [[RedBlackView alloc] initWithNode:(RedBlackNode *)self.node.left];
        [self addSubview:self.left];
    }
}
-(void)fixRight{
    if (self.node.right) {
        self.right = [[RedBlackView alloc] initWithNode:(RedBlackNode *)self.node.right];
        [self addSubview:self.right];
    }
}
-(void)fixViews{
    switch ([(RedBlackNode*)self.node color]) {
        case RED:
            [self.value.layer setBorderColor:[UIColor redColor].CGColor];
            break;
        case BLACK:
            [self.value.layer setBorderColor:[UIColor blackColor].CGColor];
            break;
        default:
            break;
    }
    [super fixViews];

}
@end
