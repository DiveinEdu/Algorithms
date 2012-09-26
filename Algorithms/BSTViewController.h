//
//  BSTViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"
@class BinarySearchTree;
@class BSTView;

@interface BSTViewController : DataViewController
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) BSTView *rootView;
@property (nonatomic, strong) BinarySearchTree* binarySearchTree;
@property (weak, nonatomic) IBOutlet UIScrollView *treeView;

- (IBAction)addToTree:(id)sender;

@end
