//
//  RedBlackTree.h
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RedBlackNode;

@interface RedBlackTree : NSObject
@property (nonatomic, strong)RedBlackNode* root;

-(BOOL)addValue:(id)value;
-(RedBlackNode*)removeValue:(id)value;

@end
