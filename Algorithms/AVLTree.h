//
//  AVLTree.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AVLNode;

@interface AVLTree : NSObject
@property (nonatomic, strong) AVLNode* root;

-(BOOL)addValue:(id)value;
-(AVLNode*)removeValue:(id)value;


@end
