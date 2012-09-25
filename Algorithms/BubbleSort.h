//
//  BubbleSort.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LinkedList;
@class DoublyLinkedList;

@interface BubbleSort : NSObject

-(void)sortLinkedList:(LinkedList*)list;
-(void)sortDoublyLinkedList:(DoublyLinkedList*)list;
@end
