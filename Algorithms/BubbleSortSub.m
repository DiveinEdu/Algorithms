//
//  BubbleSortSub.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "BubbleSortSub.h"
#import "ListNode.h"
#import "LinkedList.h"
@implementation BubbleSortSub
+(NSArray*)sortLinkedList:(LinkedList *)list{
    NSMutableArray* array = [NSMutableArray new];
    int i ,j;
    ListNode* cur = nil;
    ListNode* tmp = nil;
    ListNode* prev = nil;
    int size = [list size];
    for(i = 0;i <= size - 1; i++)
    {
        
        //Bubble Part
        for(j = 0, cur = [list head], prev = nil; j <= (size - i); j++)
        {
            
            tmp = [cur next];
            //check the values
            if([[cur getValue] integerValue] > [[tmp getValue] integerValue] && tmp!=nil)
            {
                [cur setNext:[tmp next]];
                [tmp setNext:cur];
                
                //fixes for swaping the first element
                if (prev == nil)
                    list.head = tmp;
                
                [prev setNext:tmp];
                prev = tmp;
                
            }
            else{
                prev = cur;
                cur = [cur next];
            }
            NSString* currentString = [NSString stringWithFormat:@"%@ looking at:%@",[list description],cur];
            if (![[array lastObject] isEqualToString:currentString]) {
                [array addObject:currentString];

            }
        }
    }
    return [NSArray arrayWithArray:array];
}
@end
