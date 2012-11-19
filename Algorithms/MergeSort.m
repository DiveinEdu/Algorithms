//
//  MergeSort.m
//  Algorithms
//
//  Created by Carl Wieland on 9/25/12.
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

+(void)sortArray:(NSMutableArray *)array{
    
    [array replaceObjectsInRange:NSMakeRange(0, [array count]) withObjectsFromArray:[MergeSort mergeSortArray:array]];
    
}
+(NSMutableArray*)mergeSortArray:(NSMutableArray*)array{
    if([array count]<=1)
        return array;
    NSInteger mid = [array count]/2;
    NSRange lRange = NSMakeRange(0, mid);
    NSRange rRange = NSMakeRange(mid, [array count]-mid);
    NSMutableArray* left = [MergeSort mergeSortArray:[NSMutableArray arrayWithArray:[array subarrayWithRange:lRange]]];
    NSMutableArray* right = [MergeSort mergeSortArray:[NSMutableArray arrayWithArray:[array subarrayWithRange:rRange]]];
    
    NSLog(@"%@",left);
    NSLog(@"%@",right);
    return [MergeSort mergeArray:left withArray:right];
    
}
+(NSMutableArray*)mergeArray:(NSMutableArray*)left withArray:(NSMutableArray*)right{
    NSMutableArray* merged = [NSMutableArray new];
    while( [left count] > 0 || [right count] > 0){
        if( [left count] > 0 && [right count] > 0){
            if ( [left[0] integerValue] <= [right[0] integerValue]){
                [merged addObject:left[0]];
                [left removeObjectAtIndex:0];
                
            }else{
                [merged addObject:right[0]];
                [right removeObjectAtIndex:0];
            }
            
        }
        else if ( [left count] > 0){
            [merged addObject:left[0]];
            [left removeObjectAtIndex:0];
        }
        else if ([right count] > 0){
            [merged addObject:right[0]];
            [right removeObjectAtIndex:0];
        }
    }
    NSLog(@"Merged:%@",merged);
    return merged;
}

@end
