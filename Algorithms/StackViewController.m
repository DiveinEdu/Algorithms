//
//  StackViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "StackViewController.h"
#import "NodeView.h"
#import "Stack.h"
#import "ListNode.h"
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
    [self.stackView setBackgroundColor:[UIColor cyanColor]];

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
-(void)refresh{
    [self.headView removeFromSuperview];
    if ([stack size]) {
        self.headView = [[NodeView alloc] initWithNode:stack.peek andDirection:NODE_DIRECTION_DOWN];
        [self.stackView addSubview:self.headView];
        [self.stackView setContentSize:CGSizeMake(self.headView.frame.size.width, self.headView.frame.size.height) ];
    }
}
- (IBAction)pushValue:(id)sender {
    [stack addValue:[ self.valueField text]];
    [self refresh];
}

- (IBAction)popValue:(id)sender {
    [stack pop];
    [self refresh];
}

- (IBAction)peekValue:(id)sender {
    ListNode* n = [stack peek];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Peek!" message:[NSString stringWithFormat:@"Peek returned a node with value: %@",[n description]] delegate:nil cancelButtonTitle:@"Great" otherButtonTitles: nil];
    [alert show];
}
@end
