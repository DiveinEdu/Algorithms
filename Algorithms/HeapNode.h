//
//  HeapNode.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/29/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeNode.h"
typedef enum{
    HEAP_MAX,
    HEAP_MIN
}HEAP_TYPE;

@interface HeapNode : TreeNode{
    HEAP_TYPE type;
}
@property ( nonatomic, strong) HeapNode* right;
@property ( nonatomic, strong) HeapNode* left;
@property (nonatomic, weak) HeapNode* parent;
-(id)initWithValue:(id)value andType:(HEAP_TYPE)heaptype;
-(void)heapifyUp;
-(void)heapifyDown;

@end
