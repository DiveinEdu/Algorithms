//
//  RedBlackTreeViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeViewController.h"

@class RedBlackTree;
@class RedBlackView;

@interface RedBlackTreeViewController : TreeViewController

@property (nonatomic, strong) RedBlackTree* tree;

- (IBAction)testRedBlack:(id)sender;
- (IBAction)removeValue:(id)sender;
- (IBAction)addValue:(id)sender;
@end
