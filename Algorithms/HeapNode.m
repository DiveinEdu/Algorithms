//
//  HeapNode.m
//  Algorithms
//
//  Created by Carl Wieland on 9/29/12.
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
    HeapNode* toSwap=nil;

    if(self.left != nil ){
        
        if (self.right != nil) {
            
            if ([self.left compare: self.right] == [self getComparitor]) {
                toSwap = self.left;
            }
            else{
                toSwap = self.right;
            }
        }
        else if ([self.left compare:self] == [self getComparitor]) {
            toSwap = self.left;
        }

    }
    else if(self.right!=nil){
        if ([self.right compare:self] ==[self getComparitor]) {
            toSwap=self.right;
        }
    }
    
    
    if (toSwap!=nil) {
        HeapNode* tmp =[HeapNode new];
        //store my values
        tmp.left = self.left;
        tmp.right = self.right;
        tmp.parent = self.parent;
        
        if (self == self.parent.left) {
            self.parent.left = toSwap;
        }
        else{
            self.parent.right = toSwap;
        }
        toSwap.parent = self.parent;
        self.parent = toSwap;

        
        if (self.left != toSwap) {
            self.left.parent = toSwap;
        }
        if (self.right != toSwap) {
            self.right.parent = toSwap;
        }

        
        
        self.left = toSwap.left;
        self.left.parent = self;
        self.right = toSwap.right;
        self.right.parent = self;
        
        

        
        toSwap.left = tmp.left == toSwap ? self : tmp.left;
        toSwap.right = tmp.right == toSwap ? self : tmp.right;

        
        [self heapifyDown];
    }


    
    
}


-(NSComparisonResult)getComparitor{
    switch (type) {
        case HEAP_MIN:
            return NSOrderedAscending;
        case HEAP_MAX:
            return NSOrderedDescending;
        default:
            return NSOrderedSame;
    }
}

@end
