//
//  DoubleLinkedList.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//


#import "LinkedList.h"
@class Node;

@interface DoublyLinkedList : LinkedList
@property (nonatomic, weak) Node* tail;

@end
