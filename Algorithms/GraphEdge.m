//
//  GraphEdge.m
//  Algorithms
//
//  Created by Carl Wieland on 12/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "GraphEdge.h"
#import "GraphNode.h"
@implementation GraphEdge
-(id)initWithNode:(GraphNode *)node{
    return [self initWithNode:node andWeight:INT_MAX];
}
-(id)initWithNode:(GraphNode *)node andWeight:(NSInteger)weight{
    self = [super init];
    if(self){
        self.node = node;
        self.weight = weight;
    }
    return self;
}
@end
