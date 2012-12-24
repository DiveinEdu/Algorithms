//
//  GraphNode.m
//  Algorithms
//
//  Created by Carl Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "GraphNode.h"
#import "Graph.h"
#import "GraphEdge.h"
#import "GraphConnections.h"

@interface GraphNode(){
    NSInteger myID;
}
@property (nonatomic, weak)Graph* graph;
-(void)removeMe:(GraphNode*)toRemove;
@end

@implementation GraphNode
-(id)initWithGraph:(Graph*)graph{
    self = [super init];
    if(self != nil){
        self.graph = graph;
        myID = [graph addNodeToGraph:self];
    }
    return self;
}
-(id)initWithValue:(id)value andGraph:(Graph *)graph{
    self = [super initWithValue:value];
    if(self != nil){
        self.graph = graph;
        myID = [graph addNodeToGraph:self];
    }
    return self;
}

-(NSInteger)degree{
    return [self outDegree]+[self inDegree];
}
-(NSInteger)outDegree{
    return [self.successors count];
}
-(NSInteger)inDegree{
    return [self.predecessors count];
}
-(BOOL)goesToNode:(GraphNode*)node{
    return [self.successors containsObject:node];
}
-(BOOL)comesFrom:(GraphNode*)node{
    return [self.predecessors containsObject:node];
}
-(NSSet*)adjoiningNodes{
    GraphConnections* suc = [self.successors copy];
    [suc unionWith:self.predecessors];
    return [suc nodes];
}

-(NSInteger)weightToNode:(GraphNode *)node{
    GraphEdge* edge = [self edgeToNode:node];
    if (edge == nil) {
        edge = [self edgeFromNode:node];
        if (edge==nil) {
            return INT_MAX;
        }
        return edge.weight;
    }
    return edge.weight;
}
-(GraphEdge*)edgeFromNode:(GraphNode *)node{
    for (GraphEdge* edge in [self.predecessors edges]) {
        if ([edge.node isEqual:node]) {
            return edge;
        }
    }
    return nil;
}
-(GraphEdge*)edgeToNode:(GraphNode *)node{
    for (GraphEdge* edge in [self.successors edges]) {
        if ([edge.node isEqual:node]) {
            return edge;
        }
    }

    return nil;
}

-(BOOL)adjoin:(GraphNode*)node{
    return [self goesToNode:node] || [self comesFrom:node];
}
-(NSString*)nodeDescription{
    if ([self getValue]==nil) {
        return [NSString stringWithFormat:@"id:%i\nin:%i\nout:%i",myID,[self inDegree],[self outDegree]];
    }
    else{
        return [NSString stringWithFormat:@"%@\nin:%i\nout:%i",[self getValue],[self inDegree],[self outDegree]];

    }

}
-(NSString*)description{
    return [NSString stringWithFormat:@"%i in: %i out:%i",myID,[self inDegree],[self outDegree]];
}
-(Graph*)graph{
    
    return _graph;
}

-(void)cleanUp{
    for (GraphNode* g in [self.predecessors edges]) {
        [g removeMe:self];
    }
    for (GraphNode* g in [self.successors edges]) {
        [g removeMe:self];
    }
}
-(void)removeMe:(GraphNode *)toRemove{
    [self.successors removeObject:toRemove];
    [self.predecessors removeObject:toRemove];
}

-(GraphConnections*)successors{
    if (_successors==nil)
        _successors = [GraphConnections new];
    return _successors;
}
-(GraphConnections*)predecessors{
    if(_predecessors==nil)
        _predecessors = [GraphConnections new];
    return _predecessors;
}

-(void)addPredecessor:(GraphNode *)pred{
    [self.predecessors addObject:[[GraphEdge alloc] initWithNode:pred]];
}
-(void)addSuccessor:(GraphNode *)object{
    [self.successors addObject:[[GraphEdge alloc] initWithNode:object]];
}

-(void)removePredecessor:(GraphNode *)pred{
    [self.predecessors removeObject:pred];
}
-(void)removeSuccessor:(GraphNode *)succ{
    [self.successors removeObject:succ];
}

-(void)addDoubleEdgeTo:(GraphNode*)toNode withWeight:(NSInteger)weight{
    GraphEdge* edge = [[GraphEdge alloc] initWithNode:toNode andWeight:weight];
    [self.successors addObject:edge];
    
    [toNode.successors addObject:[[GraphEdge alloc] initWithNode:self andWeight:weight]];
}
@end