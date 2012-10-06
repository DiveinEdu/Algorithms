//
//  TreeNode.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Node.h"
@interface TreeNode : Node
@property ( nonatomic, strong) TreeNode* right;
@property ( nonatomic, strong) TreeNode* left;
@property (nonatomic, weak) TreeNode* parent;

-(BOOL)addNode:(TreeNode*)node;
-(TreeNode*)removeNode:(TreeNode*)node;
-(TreeNode*)successor;
@end
