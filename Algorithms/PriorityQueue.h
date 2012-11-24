//
//  PriorityQueue.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;
@interface PriorityQueue : NSObject{
    NSMutableArray* queue;
}
-(void)addNode:(Node*)node;
-(NSInteger)size;
-(Node*)getNext;
@end
