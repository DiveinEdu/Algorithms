//
//  TreeViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeViewController.h"
#import "TreeView.h"

@interface TreeViewController ()

@end

@implementation TreeViewController
-(void)viewDidLoad{
    [self.scrollView setBackgroundColor:[UIColor cyanColor]];
    self.scrollView.delegate = self;
    [super viewDidLoad];
}
-(void)refresh{NSLog(@"SHOULD NOT BE USING THIS IMPLEMENTATION");
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.rootView;
}
@end
