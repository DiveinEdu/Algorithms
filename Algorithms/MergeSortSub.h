//
//  MergeSortSub.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/12/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LinkedList;
@interface MergeSortSub : NSObject
@property (nonatomic, strong) NSMutableArray* steps;
-(void)sortLinkedList:(LinkedList*)list;


@end
