//
//  Graph.h
//  Algorithms
//
//  Created by Carl Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum  {
    DIRECTED_GRAPH = 0,
    UN_DIRECTED_GRAPH = 1
}Graph_Type;

@class GraphNode;

@interface Graph : NSObject
-(id)initWithType:(Graph_Type)type;
-(NSInteger)addNodeToGraph:(GraphNode*)node;
-(GraphNode*)newNode;
-(void)check:(GraphNode*)node;
-(void)addEdgeFrom:(GraphNode*)fromNode toNode:(GraphNode*)toNode;
-(void)removeNode:(GraphNode*)node;
-(void)removeEdgeFrom:(GraphNode*)fromNode toNode:(GraphNode*)toNode;
@end
