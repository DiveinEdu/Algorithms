//
//  AlgorithmsTests.m
//  AlgorithmsTests
//
//  Created by Carl Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "AlgorithmsTests.h"
#import "BinarySearchTree.h"
#import "TreeNode.h"
@implementation AlgorithmsTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}
-(BOOL)checkSide:(TreeNode*)node{
    if (node!=nil){
        BOOL left = node.left==nil? true:([node compare:node.left] == NSOrderedDescending);
        BOOL right = node.right==nil? true:([node compare:node.right] == NSOrderedAscending);
        BOOL comp = true;
        if (node.left && node.right) {
            comp = [node.left compare:node.right]==NSOrderedAscending;
        }
        return left && right && comp && [self checkSide:[node left]] && [self checkSide:[node right]];
    }
    return true;
}
-(void)testBinarySearchTreeBalance{
    BinarySearchTree* bst = [BinarySearchTree new];
    for(int i = 0; i<1000; i++){
        [bst addValue:[NSNumber numberWithInt:arc4random()%5000]];
    }
    if(![self checkSide:bst.root])
        STFail(@"Binary Search Is Not Correctly Balanced!");

}
-(void)testBinarySearchRemove{
    BinarySearchTree* bst = [BinarySearchTree new];
    int vals[1000];
    for(int i = 0; i<1000; i++){
        vals[i]=arc4random()%5000;
        [bst addValue:[NSNumber numberWithInt:vals[i]]];
    }
    for(int i = 0; i<1000; i++){
        [bst removeValue:[bst.root getValue]];
    }
    if(bst.root !=nil){
        STFail(@"Not Correctly Removing Root!");
    }
    for(int i = 0; i<1000; i++){
        [bst addValue:[NSNumber numberWithInt:vals[i]]];
    }
    for(int i = 1000-1; i>=0; i--){
        [bst removeValue:[NSNumber numberWithInt:vals[i]]];
    }
    if(bst.root !=nil){
        STFail(@"Not Removing Everything!");
    }
}

@end
