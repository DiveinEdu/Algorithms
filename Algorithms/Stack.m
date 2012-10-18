//
//  Stack.m
//  Algorithms
//
//  Created by Carl Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Stack.h"
#import "ListNode.h"

@interface Stack ()
@property ( nonatomic, strong)ListNode* top;

@end

@implementation Stack
-(void)addValue:(id)value{
    ListNode* newNode = [[ListNode alloc] initWithValue:value];
    [self push:newNode];

}
-(void)push:(ListNode*)node{
    node.next=self.top;
    self.top=node;
    size++;
}
-(ListNode*)pop{
    ListNode* oldTop = self.top;
    self.top=[self.top next];
    size--;
    return oldTop;
}
-(ListNode*)peek{
    return self.top;
}
-(int)size{
    return size;
}
@end
