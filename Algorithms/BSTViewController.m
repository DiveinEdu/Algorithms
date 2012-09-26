//
//  BSTViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "BSTViewController.h"
#import "BinarySearchTree.h"
#import "BSTView.h"
@interface BSTViewController ()

@end

@implementation BSTViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.binarySearchTree = [BinarySearchTree new];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addToTree:(id)sender {
    TreeNode* node = [self.binarySearchTree addValue:[self.valueField text]];
    if(node){
        BSTView* newTree = [[BSTView alloc] initWithNode:node];
        if (self.rootView == nil) {
            self.rootView = newTree;
            [self.treeView addSubview:newTree];
            [newTree setFrame:CGRectMake( self.treeView.frame.size.width/2, 0,newTree.frame.size.width, newTree.frame.size.height)];
        }
        else{
            [self.rootView addBSTView:newTree];
            [self.treeView setContentSize:self.rootView.frame.size];

        }

        [self.binarySearchTree traverse];
    }
    
}
- (void)viewDidUnload {
    [self setValueField:nil];
    [self setRootView:nil];
    [self setTreeView:nil];
    [super viewDidUnload];
}
@end
