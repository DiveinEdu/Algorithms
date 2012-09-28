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
#import "TreeNode.h"
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
    self.treeView.delegate = self;

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)removeFromTree:(id)sender {
    TreeNode* node = [self.binarySearchTree removeValue:[self.valueField text]];
    if(node){
        
        if ([self.rootView.node compare:node ] == NSOrderedSame) {
            BSTView* tmpRoot = [[BSTView alloc] initWithNode:node];
            tmpRoot.left = self.rootView;
            self.rootView.parent = tmpRoot;
            [self.rootView removeNode:node];
            self.rootView = tmpRoot.left;
            [self.rootView setFrame:CGRectMake(0, 0, self.rootView.frame.size.width, self.rootView.frame.size.height)];
            [self.treeView addSubview:self.rootView];
        } else {
            [self.rootView removeNode:node];
        }
    }
}

- (IBAction)addToTree:(id)sender {
    TreeNode* node = [self.binarySearchTree addValue:[self.valueField text]];
    if(node){
        BSTView* newTree = [[BSTView alloc] initWithNode:node];
        if (self.rootView == nil) {
            self.rootView = newTree;
            [self.treeView addSubview:newTree];
            [newTree setFrame:CGRectMake( 0, 0,newTree.frame.size.width, newTree.frame.size.height)];
        }
        else{
            [self.rootView addBSTView:newTree];
            [self.treeView setContentSize:self.rootView.frame.size];

        }
        self.treeView.minimumZoomScale = self.rootView.frame.size.width / self.rootView.frame.size.width;
        self.treeView.maximumZoomScale = 2.0;
        [self.treeView setZoomScale:self.treeView.minimumZoomScale];

        [self.binarySearchTree traverse];
    }

}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.rootView;
}
- (void)viewDidUnload {
    [self setValueField:nil];
    [self setRootView:nil];
    [self setTreeView:nil];
    [super viewDidUnload];
}
@end
