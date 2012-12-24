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
@class GraphEdge;
@class GraphView;
@class GraphConnections;

@interface GraphNode : Node
@property (nonatomic, weak) GraphView* view;
@property (nonatomic, strong)GraphConnections* successors; /*outflow*/
@property (nonatomic, strong)GraphConnections* predecessors; /* inflow */


-(void)addPredecessor:(GraphNode *)pred;
-(void)addSuccessor:(GraphNode *)succ;

-(void)removePredecessor:(GraphNode *)pred;
-(void)removeSuccessor:(GraphNode *)succ;

-(void)addDoubleEdgeTo:(GraphNode*)toNode withWeight:(NSInteger)weight;

-(id)initWithGraph:(Graph*)graph;
-(id)initWithValue:(id)value andGraph:(Graph*)graph;
-(NSInteger)weightToNode:(GraphNode*)node;
-(GraphEdge*)edgeToNode:(GraphNode*)node;
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
