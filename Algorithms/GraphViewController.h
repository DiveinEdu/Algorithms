//
//  GraphViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 10/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"
#import "GraphScrollView.h"
#import "GraphView.h"
#import "GraphPopoverController.h"
@class Graph;
@interface GraphViewController : DataViewController <GraphScrollMenu, GraphPopoverDelegate>
@property (nonatomic, strong)Graph* graph;
@property (weak, nonatomic) IBOutlet GraphScrollView *scrollView;
@property (nonatomic, strong) UILongPressGestureRecognizer* pressRecognizer;
@property (nonatomic, strong) UITapGestureRecognizer* tapRecognizer;
@property (nonatomic, strong) UIMenuController* menuController;
@property (nonatomic, strong) UIPopoverController* popover;
@property (nonatomic) CGPoint touchPoint;
@property (weak, nonatomic) IBOutlet UISegmentedControl *graphType;

@end
