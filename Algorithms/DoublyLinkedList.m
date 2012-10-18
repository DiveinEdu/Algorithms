//
//  DoubleLinkedList.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DoublyLinkedList.h"
#import "ListNode.h"
@implementation DoublyLinkedList


-(void)addValueToFront:(id)value{
    [super addValueToFront:value];
    [self.head.next setPrevious:self.head];
    if (self.tail ==nil) {
        self.tail=self.head;
    }
}
//We introduce a tail pointer to keep things simpler
-(void)addValueToBack:(id)value{
    ListNode* newNode = [[ListNode alloc] initWithValue:value];

    if (self.tail == nil || self.tail.next!=nil) {
        self.tail = self.head;
        while (self.tail.next != nil ) {
            self.tail = self.tail.next;
        }
        
        [self.tail setNext: newNode];
        [newNode setPrevious:self.tail];
        self.tail = newNode;
        if (self.head == nil) {
            self.head = newNode;
        }
    }
    else{
        [self.tail setNext: newNode];
        [newNode setPrevious:self.tail];
        self.tail = newNode;
    }
    
    
}
-(ListNode*)removeBack{
    ListNode* toReturn = self.tail;

    if (self.tail==self.head) {
        self.tail=self.head=nil;
    }
    else{
        //reset the tail
        self.tail = self.tail.previous;
        //cut it off the last one
        self.tail.next=nil;
    }
    return toReturn;
}

@end
