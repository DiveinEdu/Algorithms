//
//  PriorityQueue.m
//  Algorithms
//
//  Created by Carl Wieland on 11/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "PriorityQueue.h"
#import "Node.h"

@implementation PriorityQueue
-(id)init{
    self = [super init];
    if(self) {
        queue = [NSMutableArray new];
    }
    return self;
}


-(void)addNode:(Node*)node{
    
    if ([self size] == 0)
        queue[0] = node; // insert at 0
    else
    {
        int i=0;
        for (i = [self size] - 1; i >= 0; i--) // start at end,
        {
            if ([node compare:queue[i]]==NSOrderedAscending)
                queue[i + 1] = queue[i]; // shift upward
            else
                // if smaller,
                break; // done shifting
        }
        queue[i + 1] = node; // insert it
    } // end else (nItems > 0)

}
-(NSInteger)size{
    return [queue count];
}
-(Node*)peek{
    if ([self size]>0) {
        return queue[0];
    }
    return nil;
}
-(Node*)getNext{
    if ([self size]>0) {
        Node * n = queue[0];
        [queue removeObjectAtIndex:0];
        return n;
    }
    return nil;
}
@end
