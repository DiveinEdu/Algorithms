//
//  GraphConnections.m
//  Algorithms
//
//  Created by Carl Wieland on 12/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "GraphConnections.h"
#import "GraphNode.h"
#import "GraphEdge.h"
@interface GraphConnections()
@property (nonatomic, strong)NSMutableSet* edges;
@end

@implementation GraphConnections
- (NSMutableSet*)edges{
    if(_edges==nil)
        _edges = [NSMutableSet new];
    return _edges;
}

-(NSInteger)count{
    return [self.edges count];
}
-(BOOL)containsObject:(NSObject*)obj{
    for (GraphEdge* edge in self.edges) {
        if ([edge.node isEqual:obj]) {
            return YES;
        }
    }
    return NO;
}
-(void)removeObject:(NSObject*)obj{
    for (GraphEdge* edge in [self.edges copy]) {
        if ([edge.node isEqual:obj]) {
            [self.edges removeObject:obj];
        }
    }

}
-(void)addObject:(NSObject*)obj{
    [self.edges addObject:obj];
}
-(void)unionWith:(GraphConnections*)connections{
    [self.edges unionSet:connections.edges];
}
-(NSSet*)nodes{
    NSMutableSet* nodes = [NSMutableSet new];
    for (GraphEdge* edge in self.edges) {
        [nodes addObject:edge.node];
    }
    return nodes;
}
@end
