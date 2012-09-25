//
//  BubbleSort.m
//  Algorithms
//
//  Created by Carl Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "BubbleSort.h"
#import "LinkedList.h"
#import "DoublyLinkedList.h"
#import "ListNode.h"

@implementation BubbleSort


+(void)sortLinkedList:(LinkedList *)list{
    [list traverse];
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
        
        }
    }
    [list traverse];
}

+(void)sortDoublyLinkedList:(DoublyLinkedList *)list{
    [list traverse];
    int i ,j;
    ListNode* cur = nil;
    ListNode* tmp = nil;
    ListNode* prev = nil;
    int size = [list size];
    for(i = 0;i <= size - 1; i++)
    {
        
        //Bubble Part
        for(j = 0, cur = [list head]; j <= (size - i); j++)
        {
            
            tmp = [cur next];
            prev = [cur previous];
            //check the values
            if(tmp!=nil && [[cur getValue] integerValue] > [[tmp getValue] integerValue] )
            {
                [cur setNext:[tmp next]];
                [tmp setNext:cur];
                
                //fixes for swaping the first element
                if (prev == nil)
                    list.head = tmp;
                
                [prev setNext:tmp];
                
            }
            else{
                cur = [cur next];
            }
            
        }
    }
    [list traverse];
}

@end
