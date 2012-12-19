//
//  GraphNode.h
//  Algorithms
//
//  Created by Carl Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Node.h"
#import "Node+MutableNode.h"
@class Graph;
@class GraphView;

@interface GraphNode : Node
@property (nonatomic, weak) GraphView* view;
@property (nonatomic, strong)NSMutableSet* successors; /*outflow*/
@property (nonatomic, strong)NSMutableSet* predecessors; /* inflow */


-(void)addPredecessor:(GraphNode *)pred;
-(void)addSuccessor:(GraphNode *)succ;

-(void)removePredecessor:(GraphNode *)pred;
-(void)removeSuccessor:(GraphNode *)succ;

-(id)initWithGraph:(Graph*)graph;
-(id)initWithValue:(id)value andGraph:(Graph*)graph;

-(NSInteger)degree;
-(NSInteger)outDegree;
-(NSInteger)inDegree;
-(BOOL)goesToNode:(GraphNode*)node;
-(BOOL)comesFrom:(GraphNode*)node;
-(NSSet*)adjoiningNodes;
-(BOOL)adjoin:(GraphNode*)node;
-(Graph*)graph;
-(void)cleanUp;
-(NSString*)nodeDescription;


@end
