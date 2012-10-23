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

@implementation GraphView
-(id)initWithNode:(GraphNode *)node{
    self = [super initWithFrame:CGRectMake(0, 0, 50, 50)];
    if(self){
        self.node = node;
        self.center = CGPointMake(.5, .5);
        [self.layer setCornerRadius:25];
        [self.layer setBorderColor:[UIColor blackColor].CGColor];
        [self.layer setBorderWidth:2];
        UILabel* value = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, 50, 20)];
        [value setBackgroundColor:[UIColor clearColor]];
        [value setTextAlignment:NSTextAlignmentCenter];
        [value setText:[NSString stringWithFormat:@"%@",self.node]];
        
        [self addSubview:value];
    }
    return self;
}

@end
