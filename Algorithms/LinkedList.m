//
//  LinkedList.m
//  Algorithms
//
//  Created by Carl Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "LinkedList.h"
#import "ListNode.h"
@implementation LinkedList
-(id)init{
    
    self = [super init];
    if(self!=nil){
        size=0;
    }
    
    return self;
}
-(void)addValueToFront:(id)value{
    ListNode* newNode = [[ListNode alloc] initWithValue:value];
    
    if(self.head)
        [newNode setNext:self.head];

    self.head = newNode;
    size++;
}
-(void)addValueToBack:(id)value{
    ListNode* newNode = [[ListNode alloc] initWithValue:value];

    ListNode* cur = self.head;
    while (cur.next!=nil)
        cur = cur.next;
    cur.next = newNode;
    
}
-(void)traverse{
    ListNode* n = self.head;
    NSMutableString* list = [NSMutableString string];
    while(n!=nil){
        [list appendFormat:@"%@,",[[n getValue]description]];
        n = n.next;
    }
    NSLog(@"%@",list);
}
-(void)removeFront{
    if(self.head){
        self.head = [self.head next];
        size--;
    }
    
}
-(NSString*)description{
    ListNode* n = self.head;
    NSMutableString* list = [NSMutableString string];
    while(n!=nil){
        [list appendFormat:@"%@,",[[n getValue]description]];
        n = n.next;
    }
    
    return [list substringToIndex:[list length]-1];
}
-(int)size{
    return size;
}
@end
