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
#import "Graph.h"
@interface GraphViewController (){
    GraphNode* fromNode;
}
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
-(void)viewWillAppear:(BOOL)animated{
    fromNode=nil;
    [super viewWillAppear:animated];
}
- (void)viewDidLoad
{
    self.pressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.pressRecognizer setMinimumPressDuration:.2];
    
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelMenu:)];
    [self.tapRecognizer setNumberOfTapsRequired:2];
    [self.scrollView addGestureRecognizer:self.tapRecognizer];
    [self.scrollView addGestureRecognizer:self.pressRecognizer];
    [self.scrollView setGraphDelegate:self];
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}
-(void)cancelMenu:(UITapGestureRecognizer*)recognizer{
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        [self.menuController setMenuVisible:NO animated:YES];
        [fromNode.view setShouldHighlight:NO];
        [fromNode.view refresh];
        fromNode = nil;
    }
}
-(void)longPress:(UILongPressGestureRecognizer*)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [recognizer.view becomeFirstResponder];
        
        self.menuController = [UIMenuController sharedMenuController];
        UIMenuItem* addNode = [[UIMenuItem alloc] initWithTitle: @"Add Node" action:@selector( addNewNode)];
        self.touchPoint = [recognizer locationInView:recognizer.view];
        self.menuController.menuItems = [NSArray arrayWithObjects: addNode, nil];
        CGRect bounds = CGRectMake(self.touchPoint.x, self.touchPoint.y, 0, 0);
        [self.menuController setTargetRect: bounds inView: recognizer.view.superview];
        [self.menuController setMenuVisible: YES animated: YES];

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
    GraphNode* newNode = [[GraphNode alloc] initWithValue: @"Node" andGraph:self.graph];
    GraphView* newView = [[GraphView alloc] initWithNode: newNode];
    [newNode setView:newView];
    [newView addTarget:self action:@selector(userSelectedNode:) forControlEvents:UIControlEventTouchUpInside];
    [newView setCenter:self.touchPoint];
    [self.scrollView addSubview:newView];
 
    NSLog(@"Add New Node");
}
-(void)userSelectedNode:(GraphView *)view{
    GraphNode* node = view.node;
    if (fromNode==nil) {
        fromNode=node;
        [view setShouldHighlight:YES];
    }
    else if(fromNode !=view.node){
        //we have both
        [self.graph addEdgeFrom:fromNode toNode:node];
        [fromNode.view setShouldHighlight:NO];
        [view setShouldHighlight:NO];
        [fromNode.view refresh];
        fromNode = nil;

    }
    else{
        [fromNode.view setShouldHighlight:NO];
        fromNode = nil;
    }
    [view refresh];
    
}
-(Graph*)graph{
    if (_graph==nil) {
        _graph = [Graph new];
    }
    return _graph;
}
@end
