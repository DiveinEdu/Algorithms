//
//  GraphViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"
#import "GraphScrollView.h"
#import "GraphView.h"
@class Graph;
@interface GraphViewController : DataViewController <GraphScrollMenu>
@property (nonatomic, strong)Graph* graph;
@property (weak, nonatomic) IBOutlet GraphScrollView *scrollView;
@property (nonatomic, strong) UILongPressGestureRecognizer* pressRecognizer;
@property (nonatomic, strong) UITapGestureRecognizer* tapRecognizer;
@property (nonatomic, strong) UIMenuController* menuController;
@property (nonatomic) CGPoint touchPoint;


@end
