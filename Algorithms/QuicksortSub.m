//
//  QuicksortSub.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "QuicksortSub.h"
#import "MergeSort.h"
@implementation QuicksortSub
//returns steps taken to sort
+(NSArray*)quickSort:(NSMutableArray*)array{
    return [QuicksortSub quickSort:array left:0 right:[array count]-1];
}
+(NSArray*)quickSort:(NSMutableArray*)array left:(NSInteger)left right:(NSInteger)right{
    NSMutableArray* toReturn = [NSMutableArray new];
    int i = left, j = right;
    
    NSNumber* tmp;
    NSInteger pivot = [array[(left + right) / 2] integerValue];//pivot on the middle value
    [toReturn addObject:@[[NSNumber numberWithInt:(right-left)],[NSNumber numberWithInt:pivot],[array subarrayWithRange:NSMakeRange(left, (right-left))]]];
    
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
            [toReturn addObject:[NSString stringWithFormat:@"Swapping %@, %@",tmp, array[i]]];

        }
    };
    [toReturn addObject:[array subarrayWithRange:NSMakeRange(left, (right-left))]];
    /* recursion */
    if (left < j)
        [toReturn addObjectsFromArray:[QuicksortSub quickSort:array left:left right:j]];
    if (i < right)
        [toReturn addObjectsFromArray:[QuicksortSub quickSort:array left:i right:right]];
    
    return toReturn;
    
}

@end
