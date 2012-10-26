//
//  RedBlackNode.m
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "RedBlackNode.h"


@implementation RedBlackNode
-(id)initWithValue:(id)value andColor:(NODE_COLOR)color{
    self = [super initWithValue:value];
    if (self) {
        self.color = color;
    }
    return self;
}
-(id)initCopy:(RedBlackNode *)node{
    self = [super init];
    if(self) {
        self.left = node.left;
        self.parent = node.parent;
        self.right = node.right;
    }
    return self;
}
-(RedBlackNode*)grandparent{
    NSParameterAssert(self.parent !=nil);
    NSParameterAssert(self.parent.parent !=nil);
    return self.parent.parent;
}
-(RedBlackNode*)sibling{
    NSParameterAssert(self.parent !=nil);
    if(self == self.parent.left)
        return self.parent.right;
    else
        return self.parent.left;
}
-(RedBlackNode*)uncle{
    NSParameterAssert(self.parent !=nil);
    NSParameterAssert(self.parent.parent !=nil);
    return [[self parent]sibling];
}
@end
