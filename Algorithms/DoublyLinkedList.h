//
//  DoubleLinkedList.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//


#import "LinkedList.h"
@class ListNode;

@interface DoublyLinkedList : LinkedList
@property (nonatomic, weak) ListNode* tail;
-(ListNode*)removeBack;
@end
