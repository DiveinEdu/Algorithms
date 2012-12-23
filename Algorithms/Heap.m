//
//  Heap.m
//  Algorithms
//
//  Created by Carl Wieland on 9/29/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Heap.h"
#import "Node.h"
#import "HeapNode.h"


@interface Heap()

-(HeapNode*)findNextParent;

@end

@implementation Heap
-(id)initWithType:(HEAP_TYPE)type{
    self = [super init];
    if (self) {
        heapType = type;
    }
    return self;
}


-(void)addValue:(id)value{
    HeapNode* node = [[HeapNode alloc] initWithValue:value andType:heapType];
    if(self.root != nil){
        //find correct location
        HeapNode* newParent = [self findNextParent];
        if (newParent.left == nil){
            newParent.left = node;
        }
        else{
            newParent.right = node;
        }
        node.parent = newParent;
        [node heapifyUp];
        //check root
        while (self.root.parent!=nil) {
            self.root = self.root.parent;
        }
        HeapNode* n = node;
        while(n.parent !=nil){
            n.onPath = YES;
            n = n.parent;
        }
        
        
    }
    else
        self.root = node;
    self.size += 1;
    
    
}

-(HeapNode*)getNext{
    NSLog(@" %@",[self description]);
    
    if (self.root == nil) {
        return nil;
    }
    if (self.size == 1) {
        self.size = 0;
        HeapNode* tmp = self.root;
        self.root = nil;
        return tmp;
        
    }
    HeapNode* toReturn = self.root;
    self.size--;
    HeapNode* last = [self findNextParent];
    NSAssert(last.left == last.right, @"Last's left and right are not nil!");
    //cut it off
    if (last.parent.left == last)
        last.parent.left = nil;
    else
        last.parent.right = nil;
    
    
    last.left = toReturn.left;
    last.right = toReturn.right;
    
    [last.left setParent:last];
    [last.right setParent:last];
    last.parent = self.root.parent;
    [last heapifyDown];
    HeapNode* tmp = last;
    while (tmp.parent !=nil) {
        tmp = tmp.parent;
    }
    self.root = tmp;
    
    return toReturn;
}
-(int)height:(HeapNode*)node{
    if( node == nil)
        return -1;
    else
        return MAX([self height:node.left], [self height:node.right]) + 1;
}
-(HeapNode*)findNextParent{
    
    HeapNode* toReturn = self.root;
    
    int height = [self height:self.root];
    int totalNodes =pow(2,(height+1))-1;
    //NSLog(@"level: %i height: %i totalNodes: %i, size: %i",level,height,totalNodes,self.size);
    if (self.size == totalNodes) {
        
        while (toReturn.left!=nil) {
            toReturn= toReturn.left;
        }
    }
    else{
        NSInteger location  = (self.size - pow(2,height) + 2);
        NSInteger left = 1;
        NSInteger right= totalNodes - pow(2,(height))+1;
        //        NSLog(@"Starting: %i %i %i",location, left,right);
        BOOL found = false;
        while (!found) {
            NSInteger mid = (left+right)/2;
            //            NSLog(@"Location: %i vs (%i+%i)/2=%i ",location, left,right,mid);
            
            
            if (location > mid) {
                left += (right-mid);
                //                NSLog(@"Going Right Range now: %i, %i",left,right);
                //go right
                if (toReturn.right!=nil) {
                    toReturn=toReturn.right;
                }
                else
                    found = TRUE;
            }
            else{
                //go left
                right -= (right-mid);
                //                NSLog(@"Going left range now: %i, %i",left,right);
                if (toReturn.left!=nil)
                    toReturn=toReturn.left;
                else
                    found = TRUE;
            }
            
        }
    }
    /*
     1  |2 |       3       |            4               |
     0 1 2 3  4  5  6  7   8   9   10  11  12  13  14  15
     * L R LL LR RL RR LLL LLR LRL LRR RLL RLR RRL RRR LLLL
     */
    return toReturn;
    
}
-(NSString*)description{
    NSMutableString* description = [NSMutableString new];
    [self visit:self.root withString:description];
    return description;
}
-(void)visit:(HeapNode*)node withString:(NSMutableString*)string{
    if (node.left != nil) {
        [self visit:node.left withString:string];
    }
    
    [string appendFormat:@"%@ ",[node description]];
    if (node.right != nil) {
        [self visit:node.right withString:string];
    }
    
}
@end
