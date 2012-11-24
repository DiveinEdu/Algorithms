//
//  HuffmanViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HuffmanViewController.h"
#import "HuffmanTree.h"
#import "HuffmanView.h"
@interface HuffmanViewController ()

@end

@implementation HuffmanViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    self.tree= [HuffmanTree new];
    [self.tree buildTreeWithString:@"This is a test String!"];
    [self refresh];
    [super viewDidAppear:animated];
}
-(void)refresh{
    [self.rootView removeFromSuperview];
    if ([self.tree root]) {
        self.rootView = [[HuffmanView alloc] initWithNode:(HeapNode*)[self.tree root]];
        [self.scrollView addSubview:self.rootView];
        
        [self.scrollView setContentSize:self.rootView.frame.size];
        self.scrollView.minimumZoomScale = self.scrollView.frame.size.width / self.rootView.frame.size.width;
        self.scrollView.maximumZoomScale = 2.0;
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale];
        
        
    }
    
    
}
- (IBAction)remove:(id)sender {

    [self refresh];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
