//
//  BinarySearchTree.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TreeNode;

@interface BinarySearchTree : NSObject
@property (nonatomic, strong) TreeNode* root;

-(TreeNode*)addValue:(id)value;
-(TreeNode*)removeValue:(id)value;
-(void)traverse;
@end
