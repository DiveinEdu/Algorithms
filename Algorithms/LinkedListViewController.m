//
//  LinkedListViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "LinkedListViewController.h"
#import "LinkedList.h"
#import "LinkedListView.h"
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

- (IBAction)addValue:(id)sender {
    [self.linkedList addValue:[self.insertValueField text] ];
    [self.linkedList traverse];
    [self.detailView addNode:self.linkedList.head];
}

- (IBAction)removeFront:(id)sender {
    [self.linkedList removeFront];
    [self.detailView removeNode];
    [self.linkedList traverse];

    
}

- (IBAction)showCode:(id)sender {
}

@end
