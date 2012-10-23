//
//  LinkedListViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "LinkedListViewController.h"
#import "LinkedList.h"
#import "NodeView.h"
@interface LinkedListViewController ()
@property (nonatomic, strong) LinkedList* linkedList;

@end

@implementation LinkedListViewController
@synthesize detailView;
@synthesize insertValueField;

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
    self.linkedList = [LinkedList new];
    [self.detailView setBackgroundColor:[UIColor cyanColor]];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setInsertValueField:nil];
    [self setDetailView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
-(void)refresh{
    [self.headView removeFromSuperview];
    if ([self.linkedList head]) {
        self.headView = [[NodeView alloc] initWithNode:self.linkedList.head andDirection:NODE_DIRECTION_RIGHT];
        [self.detailView addSubview:self.headView];
        [self.detailView setContentSize:CGSizeMake(self.headView.frame.size.width, self.headView.frame.size.height) ];
    }
}
- (IBAction)addValue:(id)sender {
    [self.linkedList addValueToFront:[self.insertValueField text] ];
    [self refresh];
}

- (IBAction)removeFront:(id)sender {
    [self.linkedList removeFront];
    [self refresh];

    
}

- (IBAction)showCode:(id)sender {
}

@end
