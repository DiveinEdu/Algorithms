//
//  ArrayHeap.m
//  Algorithms
//
//  Created by Carl Wieland on 9/29/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "ArrayHeap.h"
#import "HeapNode.h"
@implementation ArrayHeap

-(NSMutableArray*)nodes{
    if (_nodes != nil)
        return _nodes;    
    _nodes = [NSMutableArray new];
    return _nodes;
}

-(void)addValue:(id)value{
    HeapNode* node = [[HeapNode alloc] initWithValue:value];
    [self.nodes addObject:node];
    [self heapifyUp:([self.nodes count]-1) ];
}


-(HeapNode*)getMin{
    if ([self.nodes count] >0) {
        HeapNode* min = self.nodes[0];
        self.nodes[0] = self.nodes[([self.nodes count] - 1)];
        [self.nodes removeLastObject];
        [self heapifyDown:0];
        return min;

    }
    return nil;
}


-(int) left:(int) parent{
    int i = ( parent << 1 ) + 1;
    return ( i < [self.nodes count] ) ? i : -1;
}
-(int) right:(int) parent{
    int i = ( parent << 1 ) + 2;
    return ( i < [self.nodes count] ) ? i : -1;
}
-(int) parent:(int) child{
    if (child != 0)
    {
        int i = (child - 1) >> 1;
        return i;
    }
    return -1;
}

-(void) heapifyUp:(int) index{
    while ( ( index > 0 ) && ( [self parent:index] >= 0 ) &&
           ( [self.nodes[[self parent:index]] compare: self.nodes[index]]==NSOrderedDescending ) )
    {
        id tmp = self.nodes[ [self parent:index] ];
        self.nodes[[self parent:index]] = self.nodes[index];
        self.nodes[index] = tmp;
        index =[self parent:index];
    }
}
-(void) heapifyDown:(int) index{
    int child = [self left:index];
    if ( ( child > 0 ) && ( [self right:index] > 0 ) &&
        ( [self.nodes[child] compare:self.nodes[[self right:index]]]==NSOrderedDescending ) )
    {
        child = [self right:index];
    }
    if ( child > 0 )
    {
        id tmp = self.nodes[index];
        self.nodes[index] = self.nodes[child];
        self.nodes[child] = tmp;
        [self heapifyDown:child];
    }
}
-(NSString*)description{
    NSMutableString* description = [NSMutableString new];
    [self visit:0 withString:description];
    return description;
}
-(void)visit:(int)node withString:(NSMutableString*)string{
    if ([self left:node]<[self.nodes count]) {
        [self visit:[self left:node] withString:string];
    }

    [string appendFormat:@"%@ ",self.nodes[node]];
    if([self right:node]<[self.nodes count])
        [self visit:[self right:node] withString:string];
}
@end
