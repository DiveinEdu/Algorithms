//
//  ArrayHeap.h
//  Algorithms
//
//  Created by Carl Wieland on 9/29/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Heap.h"

@interface ArrayHeap : Heap
@property (nonatomic, strong)NSMutableArray* nodes;
-(void)addNode:(HeapNode*)node;

@end
