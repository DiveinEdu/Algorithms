//
//  BSTViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeViewController.h"
@class BinarySearchTree;
@class BSTView;

@interface BSTViewController : TreeViewController

@property (nonatomic, strong) BinarySearchTree* binarySearchTree;

- (IBAction)removeFromTree:(id)sender;

- (IBAction)addToTree:(id)sender;
- (IBAction)testTree:(id)sender;

@end
