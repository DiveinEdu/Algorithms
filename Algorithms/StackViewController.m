//
//  StackViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "StackViewController.h"
#import "StackView.h"
#import "Stack.h"
#import "Node.h"
@interface StackViewController ()

@end

@implementation StackViewController

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
    stack=[Stack new];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setValueField:nil];
    [self setStackView:nil];
    [super viewDidUnload];
}
- (IBAction)pushValue:(id)sender {
    [stack addValue:[ self.valueField text]];
    [self.stackView addNode:[stack peek]];
}

- (IBAction)popValue:(id)sender {
    [stack pop];
    [self.stackView removeNode];
}

- (IBAction)peekValue:(id)sender {
    Node* n = [stack peek];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Peek!" message:[NSString stringWithFormat:@"Peek returned a node with value: %@",[n description]] delegate:nil cancelButtonTitle:@"Great" otherButtonTitles: nil];
    [alert show];
}
@end
