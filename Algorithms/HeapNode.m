//
//  HeapNode.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/29/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HeapNode.h"

@implementation HeapNode
-(id)initWithValue:(id)value andType:(HEAP_TYPE)heaptype{
    self = [super initWithValue:value];
    if (self) {
        type = heaptype;
    }
    return self;
}
/*
    1     2      3
   0     0 1   2   1
              0
 */
-(void)heapifyUp{
    while (self.parent!=nil && [self compare:self.parent]==[self getComparitor]) {
        //NSLog(@"Swapping: %@ with %@",self,self.parent);
        HeapNode* tmp =[HeapNode new];
        //store my values
        tmp.left = self.left;
        tmp.right = self.right;
        tmp.parent = self.parent;

        self.left = (self == self.parent.left)? self.parent : self.parent.left;
        self.right = (self == self.parent.right)? self.parent : self.parent.right;
        

        //reset my childs (old parent) pointers
        self.parent.left = tmp.left;
        self.parent.right = tmp.right;
        tmp.left.parent = self.parent;
        tmp.right.parent = self.parent;
        
        if (self.parent.parent.left == self.parent) {
            self.parent.parent.left = self;
        }
        else{
            self.parent.parent.right = self;
        }
        
        
        self.parent = self.parent.parent;
        self.left.parent = self;
        self.right.parent = self;
        
        //NSLog(@"Up: %@ Left:%@ Right:%@",self.parent, self.left, self.right);
        
    }

}
-(void)heapifyDown{
    
    
}


-(NSComparisonResult)getComparitor{
    switch (type) {
        case HEAP_MAX:
            return NSOrderedAscending;
        case HEAP_MIN:
            return NSOrderedDescending;
        default:
            return NSOrderedSame;
    }
}

@end
