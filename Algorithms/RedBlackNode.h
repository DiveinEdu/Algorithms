//
//  RedBlackNode.h
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeNode.h"
typedef enum{
    RED,
    BLACK
} NODE_COLOR;

@interface RedBlackNode : TreeNode
@property ( nonatomic, strong) RedBlackNode* right;
@property ( nonatomic, strong) RedBlackNode* left;
@property (nonatomic, weak) RedBlackNode* parent;
@property (nonatomic)NODE_COLOR color;
-(id)initWithValue:(id)value andColor:(NODE_COLOR)color;

@end
