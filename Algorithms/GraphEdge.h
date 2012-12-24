//
//  GraphEdge.h
//  Algorithms
//
//  Created by Carl Wieland on 12/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GraphNode;
@interface GraphEdge : NSObject

@property (nonatomic, weak)GraphNode* node;
@property (nonatomic)NSInteger weight;
-(id)initWithNode:(GraphNode*)node;
-(id)initWithNode:(GraphNode*)node andWeight:(NSInteger)weight;
@end
