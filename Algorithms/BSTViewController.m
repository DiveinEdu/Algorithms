//
//  TreeViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "BSTViewController.h"
#import "BinarySearchTree.h"
#import "TreeView.h"
#import "TreeNode.h"

@implementation BSTViewController


- (void)viewDidLoad
{
    self.inArray = [NSMutableArray new];
    self.binarySearchTree = [BinarySearchTree new];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)refresh{
    [self.rootView removeFromSuperview];
    if (self.binarySearchTree.root) {
        self.rootView = [[TreeView alloc] initWithNode:self.binarySearchTree.root];
        [self.scrollView addSubview:self.rootView];
        self.scrollView.minimumZoomScale = self.scrollView.frame.size.width / self.rootView.frame.size.width;
        self.scrollView.maximumZoomScale = 2.0;
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale];
    }
}
- (IBAction)removeFromTree:(id)sender {
    [self.binarySearchTree removeValue:[self.valueField text]];
    [self refresh];
    
    
}
- (IBAction)addToTree:(id)sender {
    [self.binarySearchTree addValue:[self.valueField text]];
    [self refresh];

}

- (IBAction)testTree:(id)sender {
    for (int i = 0; i<16; i++) {
        [self.valueField setText:[NSString stringWithFormat:@"%i",arc4random()%500]];
        [self addToTree:self];
    }
    
}

- (void)viewDidUnload {
    [self setValueField:nil];
    [self setRootView:nil];
    [super viewDidUnload];
}
@end
