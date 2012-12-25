//
//  SkipNode.h
//  Algorithms
//
//  Created by Carl Wieland on 12/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Node.h"

@interface SkipNode : Node

-(SkipNode*)nodeAtLevel:(NSInteger)level;
-(void)addNode:(SkipNode*)node atLevel:(NSInteger)level;

@end
