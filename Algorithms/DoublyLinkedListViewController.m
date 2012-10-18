//
//  DoublyLinkedListViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DoublyLinkedListViewController.h"
#import "DoublyLinkedList.h"
#import "NodeView.h"

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
-(void)refresh{
    [self.headView removeFromSuperview];
    if ([self.doublyLinkedList head]) {
        self.headView = [[NodeView alloc] initWithNode:self.doublyLinkedList.head andDirection:NODE_DIRECTION_RIGHT];
        [self.listView addSubview:self.headView];
        [self.listView setContentSize:CGSizeMake(self.headView.frame.size.width, self.headView.frame.size.height) ];
    }
}
- (IBAction)addFront:(id)sender {
    [self.doublyLinkedList addValueToFront:[self.inputField text] ];
    [self refresh];

}

-(IBAction)addBack:(id)sender{
    [self.doublyLinkedList addValueToBack:[self.inputField text] ];
    [self refresh];
}

- (IBAction)removeFront:(id)sender {
    [self.doublyLinkedList removeFront];
    [self refresh];
}

- (IBAction)removeBack:(id)sender {
    [self.doublyLinkedList removeBack];
    [self refresh];
}
@end
