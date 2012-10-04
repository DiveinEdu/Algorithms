//
//  RedBlackTreeViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "RedBlackTreeViewController.h"
#import "RedBlackTree.h"
#import "RedBlackView.h"
@interface RedBlackTreeViewController ()

@end

@implementation RedBlackTreeViewController

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
    [self.scrollView setBackgroundColor:[UIColor cyanColor]];
    self.scrollView.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setValueField:nil];
    [super viewDidUnload];
}
-(RedBlackTree*)tree{
    if (_tree!=nil) {
        return _tree;
    }
    _tree = [[RedBlackTree alloc] init];
    return _tree;
}
- (IBAction)testRedBlack:(id)sender {
    for (int i = 0; i<1; i++) {
        [self.valueField setText:[NSString stringWithFormat:@"%i",arc4random()%500]];
        [self addValue:self];
    }
    
}
-(void)refresh{
    [self.rootView removeFromSuperview];
    if (self.tree.root) {
        self.rootView = [[RedBlackView alloc] initWithNode:self.tree.root];
        [self.scrollView addSubview:self.rootView];
        self.scrollView.minimumZoomScale = self.scrollView.frame.size.width / self.rootView.frame.size.width;
        self.scrollView.maximumZoomScale = 2.0;
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale];
    }
}
- (IBAction)removeValue:(id)sender {
}

- (IBAction)addValue:(id)sender {
    [self.tree addValue:[self.valueField text]];
    [self refresh];
}
@end
