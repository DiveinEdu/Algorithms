//
//  MergeSort.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "MergeSort.h"
#import "ListNode.h"
#import "LinkedList.h"

@implementation MergeSort

+(void)sortLinkedList:(LinkedList *)list{
    [list traverse];
    list.head = [MergeSort mergeSort:[list head]];
    [list traverse];
}

+(ListNode*) mergeSort:(ListNode *)head
{
    ListNode *secondNode;
    
    if (head == NULL)
        return NULL;
    else if (head.next == NULL)
        return head;
    else
    {
        secondNode = [MergeSort split:head];
        return [MergeSort merge:[MergeSort mergeSort:head] with:[MergeSort mergeSort:secondNode]];
    }
}

+(ListNode*) merge:(ListNode*)firstNode with:(ListNode*) secondNode
{
    if (firstNode == NULL) return secondNode;
    else if (secondNode == NULL) return firstNode;
    else if ([[firstNode getValue] integerValue] <= [[secondNode getValue] integerValue])   {
        firstNode.next = [MergeSort merge:firstNode.next with: secondNode];
        return firstNode;
    }
    else
    {
        secondNode.next = [MergeSort merge:firstNode with: secondNode.next];
        return secondNode;
    }
}

+(ListNode*)split:(ListNode*)head
{
    ListNode* secondNode;
    
    if (head == NULL) return NULL;
    else if (head.next == NULL) return NULL;
    else {
        secondNode = head.next;
        head.next = secondNode.next;
        secondNode.next = [MergeSort split:secondNode.next];
        return secondNode;
    }
}

@end
