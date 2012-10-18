//
//  MergeSortSub.m
//  Algorithms
//
//  Created by Carl Wieland on 10/12/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "MergeSortSub.h"
#import "ListNode.h"
#import "LinkedList.h"

@implementation MergeSortSub
-(void)sortLinkedList:(LinkedList *)list{
    
    list.head = [self mergeSort:[list head]];
    [self.steps addObject:[self printList:list.head]];
}
-(NSMutableArray*)steps{
    if (_steps !=nil) {
        return _steps;
    }
    _steps = [NSMutableArray new];
    return _steps;
}

-(NSString*) printList:(ListNode*)node{
    NSMutableString* string = [NSMutableString string];
    ListNode* tmp = node;
    while (tmp!=nil) {
        [string appendFormat:@"%@, ",[tmp description]];
        tmp = tmp.next;
    }
    return [string substringToIndex:[string length]-2];
    
}

-(ListNode*) mergeSort:(ListNode *)head{
    ListNode *secondNode;
    
    if (head == NULL)
        return NULL;
    else if (head.next == NULL)
        return head;
    else
    {
        secondNode = [self split:head];
        
        ListNode* left = [self mergeSort:head];
        ListNode* right = [self mergeSort:secondNode];
        NSString* step =[NSString stringWithFormat:@"%@ merge with: %@",[self printList:left],[self printList:right]];
        [self.steps addObject:step];
        return [self merge:left with:right];
    }
}

-(ListNode*) merge:(ListNode*)firstNode with:(ListNode*) secondNode{
    if (firstNode == NULL) return secondNode;
    else if (secondNode == NULL) return firstNode;
    else if ([[firstNode getValue] integerValue] <= [[secondNode getValue] integerValue])   {
        firstNode.next = [self merge:firstNode.next with: secondNode];
        return firstNode;
    }
    else
    {
        secondNode.next = [self merge:firstNode with: secondNode.next];
        return secondNode;
    }
}

-(ListNode*)split:(ListNode*)head{
    ListNode* secondNode;
    
    if (head == NULL) return NULL;
    else if (head.next == NULL) return NULL;
    else {
        secondNode = head.next;
        head.next = secondNode.next;
        secondNode.next = [self split:secondNode.next];
        return secondNode;
    }
}

@end
