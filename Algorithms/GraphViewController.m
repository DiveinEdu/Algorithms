//
//  GraphViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "GraphViewController.h"
#import "GraphScrollView.h"
#import "GraphNode.h"
#import "GraphView.h"

@interface GraphViewController ()

@end

@implementation GraphViewController

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
    self.pressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.pressRecognizer setMinimumPressDuration:.2];
    [self.scrollView addGestureRecognizer:self.pressRecognizer];
    [self.scrollView setGraphDelegate:self];
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}

-(void)longPress:(UILongPressGestureRecognizer*)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [recognizer.view becomeFirstResponder];
        
        UIMenuController* mc = [UIMenuController sharedMenuController];
        UIMenuItem* addNode = [[UIMenuItem alloc] initWithTitle: @"Add Node" action:@selector( addNewNode)];
        self.touchPoint = [recognizer locationInView:recognizer.view];
        mc.menuItems = [NSArray arrayWithObjects: addNode, nil];
        CGRect bounds = CGRectMake(self.touchPoint.x, self.touchPoint.y, 0, 0);
        [mc setTargetRect: bounds inView: recognizer.view.superview];
        [mc setMenuVisible: YES animated: YES];

    }
      
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScrollView:nil];
    [super viewDidUnload];
}



//Graph Scroll View Delegates
-(void)addNewNode{
    GraphNode* newNode = [[GraphNode alloc] initWithValue: @"Node"];
    GraphView* newView = [[GraphView alloc] initWithNode: newNode];
    [newView setCenter:self.touchPoint];
    [self.scrollView addSubview:newView];
 
    NSLog(@"Add New Node");
}
@end
