//
//  RedBlackNode.h
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeNode.h"
typedef enum{
    BLACK=0,
    RED=1
} NODE_COLOR;

@interface RedBlackNode : TreeNode
@property ( nonatomic, strong) RedBlackNode* right;
@property ( nonatomic, strong) RedBlackNode* left;
@property (nonatomic, weak) RedBlackNode* parent;
@property (nonatomic)NODE_COLOR color;
-(id)initWithValue:(id)value andColor:(NODE_COLOR)color;
-(id)initCopy:(RedBlackNode*)node;
-(RedBlackNode*)grandparent;
-(RedBlackNode*)sibling;
-(RedBlackNode*)uncle;
@end
