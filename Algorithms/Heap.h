//
//  Heap.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/29/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeapNode.h"
@interface Heap : NSObject{
    HEAP_TYPE heapType;
}
@property(nonatomic) NSInteger size;
@property (nonatomic, strong)HeapNode* root;

-(id)initWithType:(HEAP_TYPE)type;
-(void)addValue:(id)value;
-(HeapNode*)getNext;
-(NSString*)description;
@end
