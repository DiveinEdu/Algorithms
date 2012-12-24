//
//  Graph.m
//  Algorithms
//
//  Created by Carl Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Graph.h"
#import "GraphNode.h"
@interface Graph()
@property (nonatomic,strong)NSMutableSet* nodes;
@property (nonatomic)Graph_Type type;
@end

@implementation Graph
-(id)initWithType:(Graph_Type)type{
    if((self = [super init])){
        self.type = type;
    }
    return self;
}
-(NSInteger)addNodeToGraph:(GraphNode*)node{
    if([self.nodes containsObject:node])
        return -1;
    else
        [self.nodes addObject:node];
    return [self.nodes count];
}

-(GraphNode*)newNode{
    GraphNode* newNode = [[GraphNode alloc] initWithGraph:self];
    return newNode;
}

-(void)check:(GraphNode*)node{
    NSAssert(self==[node graph], @"Node Not In Graph!");
}
-(void)addEdgeFrom:(GraphNode*)fromNode toNode:(GraphNode*)toNode{
    if (self.type == DIRECTED_GRAPH) {
        [self check:fromNode];
        [self check:toNode];
        if ([fromNode goesToNode:toNode]) return;
        
        [toNode addPredecessor:fromNode];
        [fromNode addSuccessor:toNode];

    }
    else if(self.type == UN_DIRECTED_GRAPH){
        [toNode addDoubleEdgeTo:fromNode withWeight:0];
    }
}
-(void)removeNode:(GraphNode*)node{
    [self check:node];
    [node cleanUp];
    [self.nodes removeObject:node];
}
-(void)removeEdgeFrom:(GraphNode*)fromNode toNode:(GraphNode*)toNode{
    [self check:fromNode];
    [self check:toNode];
    if (![fromNode goesToNode:toNode]) return;
    
    [toNode removePredecessor:fromNode];
    [fromNode removeSuccessor:toNode];
}


-(NSString*)description{
    NSMutableString* desc=[NSMutableString new];
    for (GraphNode* node in self.nodes) {
        [desc appendFormat:@"%@:",node];
        
    }
    return desc;
}
-(NSMutableSet*)nodes{
    if(_nodes)
        return _nodes;
    else
        _nodes = [NSMutableSet new];
    return _nodes;
}

@end
