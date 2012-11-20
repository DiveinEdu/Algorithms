//
//  GraphNode.m
//  Algorithms
//
//  Created by Carl Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "GraphNode.h"
#import "Graph.h"
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
    NSMutableSet* suc = [self.successors copy];
    [suc unionSet:self.predecessors];
    return suc;
    
}
-(BOOL)adjoin:(GraphNode*)node{
    return [self goesToNode:node] || [self comesFrom:node];
}

-(NSString*)description{
    return [NSString stringWithFormat:@"%i in: %i out:%i\n%@",myID,[self inDegree],[self outDegree],self.successors];
}
-(Graph*)graph{
    
    return _graph;
}

-(void)cleanUp{
    for (GraphNode* g in self.predecessors) {
        [g removeMe:self];
    }
    for (GraphNode*g in self.successors) {
        [g removeMe:self];
    }
}
-(void)removeMe:(GraphNode *)toRemove{
    [self.successors removeObject:toRemove];
    [self.predecessors removeObject:toRemove];
}

-(NSMutableSet*)successors{
    if (_successors==nil)
        _successors = [NSMutableSet new];
    return _successors;
}
-(NSMutableSet*)predecessors{
    if(_predecessors==nil)
        _predecessors = [NSMutableSet new];
    return _predecessors;
}

-(void)addPredecessor:(GraphNode *)pred{
    [self.predecessors addObject:pred];
}
-(void)addSuccessor:(GraphNode *)object{
    [self.successors addObject:object];
}
-(void)removePredecessor:(GraphNode *)pred{
    [self.predecessors removeObject:pred];
}
-(void)removeSuccessor:(GraphNode *)succ{
    [self.successors removeObject:succ];
}
@end