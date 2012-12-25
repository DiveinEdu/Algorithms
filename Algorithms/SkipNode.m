//
//  SkipNode.m
//  Algorithms
//
//  Created by Carl Wieland on 12/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "SkipNode.h"
@interface SkipNode()
@property (nonatomic, strong)NSMutableArray* jumpList;
@end

@implementation SkipNode
-(SkipNode*)nodeAtLevel:(NSInteger)level{
    return [self.jumpList objectAtIndex:level];
}
-(void)addNode:(SkipNode *)node atLevel:(NSInteger)level{
    [self.jumpList replaceObjectAtIndex:level withObject:node];
}
@end
