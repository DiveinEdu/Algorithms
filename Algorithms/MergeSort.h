//
//  MergeSort.h
//  Algorithms
//
//  Created by Carl Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LinkedList;
@interface MergeSort : NSObject
+(void)sortLinkedList:(LinkedList*)list;
+(void)sortArray:(NSMutableArray*)array;
@end
