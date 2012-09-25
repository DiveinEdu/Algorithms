//
//  DoublyLinkedListViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DoublyLinkedListViewController.h"
#import "DoublyLinkedList.h"
#import "DoublyLinkedListView.h"
@interface DoublyLinkedListViewController ()

@end

@implementation DoublyLinkedListViewController

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
    self.doublyLinkedList = [DoublyLinkedList new];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setListView:nil];
    [self setInputField:nil];
    [super viewDidUnload];
}
- (IBAction)addFront:(id)sender {
    [self.doublyLinkedList addValueToFront:[self.inputField text] ];
    [self.doublyLinkedList traverse];
    [self.listView addNode:self.doublyLinkedList.head];
}

-(IBAction)addBack:(id)sender{
    [self.doublyLinkedList addValueToBack:[self.inputField text] ];
    [self.doublyLinkedList traverse];
    [self.listView addNode:self.doublyLinkedList.head];
}
@end
