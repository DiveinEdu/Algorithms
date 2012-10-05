//
//  AVLTreeController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeViewController.h"
@class AVLTree;

@interface AVLTreeController : TreeViewController
@property (nonatomic, strong)AVLTree* tree;
- (IBAction)removeValue:(id)sender;
- (IBAction)testTree:(id)sender;

- (IBAction)addValue:(id)sender;
@end
