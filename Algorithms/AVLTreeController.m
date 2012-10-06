//
//  AVLTreeController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "AVLTreeController.h"
#import "AVLTree.h"
#import "TreeView.h"

@interface AVLTreeController ()

@end

@implementation AVLTreeController
-(AVLTree*)tree{
    if (_tree != nil) {
        return _tree;
    }
    _tree = [AVLTree new];
    return _tree;
}

- (IBAction)removeValue:(id)sender {
    [self.tree removeValue:[self.valueField text]];
    [self refresh];
}
-(void)refresh{
    [self.rootView removeFromSuperview];
    if (self.tree.root) {
        self.rootView = [[TreeView alloc] initWithNode:(TreeNode*)self.tree.root];
        [self.scrollView addSubview:self.rootView];
        self.scrollView.minimumZoomScale = self.scrollView.frame.size.width / self.rootView.frame.size.width;
        self.scrollView.maximumZoomScale = 2.0;
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale];
    }
}
- (IBAction)testTree:(id)sender {
    for (int i = 0; i<1; i++) {
        [self.valueField setText:[NSString stringWithFormat:@"%i",arc4random()%500]];
        [self addValue:self];
    }
}

- (IBAction)addValue:(id)sender {
    [self.tree addValue:[self.valueField text]];
    [self refresh];
}

@end
