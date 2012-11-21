//
//  GraphView.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "GraphView.h"
#import <QuartzCore/QuartzCore.h>
#import "GraphNode.h"
#import "ArrowView.h"
@interface GraphView()
@property (nonatomic, strong)NSMutableArray* arrowViews;
@end
@implementation GraphView
#define GRAPH_NODE_DIAMETER 80
-(id)initWithNode:(GraphNode *)node{
    self = [super initWithFrame:CGRectMake(0, 0, GRAPH_NODE_DIAMETER, GRAPH_NODE_DIAMETER)];
    if(self){
        self.node = node;
        self.center = CGPointMake(.5, .5);
        [self.layer setCornerRadius:GRAPH_NODE_DIAMETER/2];
        [self.layer setBorderColor:[UIColor blackColor].CGColor];
        [self.layer setBorderWidth:2];
        [self setBackgroundColor:[UIColor whiteColor]];
        UILabel* value = [[UILabel alloc] initWithFrame:CGRectMake(0, GRAPH_NODE_DIAMETER/2-10, 75, 20)];
        [value setBackgroundColor:[UIColor clearColor]];
        [value setTextAlignment:NSTextAlignmentCenter];
        [value setText:[NSString stringWithFormat:@"%@",self.node]];
        self.shouldHighlight = NO;
        self.arrowViews = [NSMutableArray new];
        [self addSubview:value];
        
    }
    return self;
}
-(void)refresh{
    if(self.shouldHighlight == YES)
        [self.layer setBorderColor:[UIColor redColor].CGColor];
    else
        [self.layer setBorderColor:[UIColor blackColor].CGColor];

    for (ArrowView *v in self.arrowViews) {
        [v removeFromSuperview];
    }
    
    for (GraphNode* n in self.node.successors) {
        [self addArrowTo:n];
    }
}


-(void)addArrowTo:(GraphNode*)n{
    CGFloat width = 0;
    CGFloat height = 0;
    width = abs(self.center.x - n.view.center.x);
    if(self.center.x>n.view.center.x)
        width*=-1;
    
    height = abs(self.center.y-n.view.center.y);
    if (self.center.y>n.view.center.y)
        height*=-1;


    
    CGPoint mid = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    /*draw arrow to their node*/
    ArrowView* av = [[ArrowView alloc] initWithStartPoint:mid andEndPoint:CGPointMake(mid.x+width, mid.y+height) withOffset:GRAPH_NODE_DIAMETER/2];
    [self.arrowViews addObject:av];
    [self addSubview:av];
}


@end
