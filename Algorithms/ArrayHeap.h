//
//  ArrayHeap.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/29/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Heap.h"

@interface ArrayHeap : Heap
@property (nonatomic, strong)NSMutableArray* nodes;

-(int) left:(int) parent;
-(int) right:(int) parent;
-(int) parent:(int) child;
-(void) heapifyUp:(int) index;
-(void) heapifyDown:(int) index;
@end
