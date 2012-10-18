//
//  BSTViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeViewController.h"
@class BinarySearchTree;

@interface BSTViewController : TreeViewController

@property (nonatomic, strong) BinarySearchTree* binarySearchTree;

- (IBAction)removeFromTree:(id)sender;

- (IBAction)addToTree:(id)sender;
- (IBAction)testTree:(id)sender;

@end
