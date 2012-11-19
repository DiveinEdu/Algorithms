//
//  QuicksortSub.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Quicksort.h"

@interface QuicksortSub : Quicksort
@property (nonatomic, strong) NSMutableArray* steps;
+(NSArray*)quickSort:(NSMutableArray*)array;
+(NSArray*)quickSort:(NSMutableArray*)array left:(NSInteger)left right:(NSInteger)right;

@end
