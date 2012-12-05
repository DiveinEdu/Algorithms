//
//  Quicksort.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Quicksort.h"
#import "MergeSort.h"
@implementation Quicksort
+(void)quickSort:(NSMutableArray*)array{
    [Quicksort quickSort:array left:0 right:[array count]-1];
}
+(void)quickSort:(NSMutableArray*)array left:(NSInteger)left right:(NSInteger)right{
    int i = left, j = right;
    NSNumber* tmp;
    NSInteger pivot = ([array[(left + right) / 2] integerValue]+[array[left] integerValue]+[array[right] integerValue])/3;//pivot on the average of left,right and middle
    
    /* partition */
    while (i <= j) {
        while ([array[i] integerValue] < pivot)
            i++;
        while ([array[j] integerValue] > pivot)
            j--;
        if (i <= j) {
            tmp = array[i];
            array[i] = array[j];
            array[j] = tmp;
            i++;
            j--;
        }
    };
    
    /* recursion */
    if (left < j)
        [Quicksort quickSort:array left:left right:j];
    if (i < right)
        [Quicksort quickSort:array left:i right:right];
    
}
@end
