//
//  Graph.h
//  Algorithms
//
//  Created by Carl Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GraphNode;

@interface Graph : NSObject
-(NSInteger)addNodeToGraph:(GraphNode*)node;
-(GraphNode*)newNode;
-(void)check:(GraphNode*)node;
-(void)addEdgeFrom:(GraphNode*)fromNode toNode:(GraphNode*)toNode;
-(void)removeNode:(GraphNode*)node;
-(void)removeEdgeFrom:(GraphNode*)fromNode toNode:(GraphNode*)toNode;
@end
