//
//  BinarySearchTree.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "BinarySearchTree.h"
#import "TreeNode.h"

@implementation BinarySearchTree
-(TreeNode*)addValue:(id)value{
    TreeNode* node = [[TreeNode alloc] initWithValue:value];
    if(self.root == nil){
        self.root = node;
        return node;
    }
    else{
        if([self addNode:node withRoot:self.root])
            return node;
        else return nil;
    }
    
}

-(BOOL)addNode:(TreeNode*)node withRoot:(TreeNode*)root{
    switch ([node compare:root]) {
        case NSOrderedAscending:
            if (root.right == nil){
                root.right = node;
                return YES;
            }
            else
                return [self addNode:node withRoot:root.right];
        case NSOrderedDescending:
            if  (root.left==nil){
                root.left = node;
                return YES;
            }
            else
                return [self addNode:node withRoot:root.left];
        case NSOrderedSame:
            return false;
    }
    
    
}
-(void)traverse{
    NSMutableString* path = [NSMutableString new];
    [self visit:self.root toString:path];
    NSLog(@"%@",path);
}
-(void)visit:(TreeNode*)node toString:(NSMutableString*)sorted{
    if (node.left !=nil) {
        [self visit:node.left toString:sorted];
    }
    [sorted appendFormat:@"%@ ",[node getValue]];
    if (node.right !=nil) {
        [self visit:node.right toString:sorted];
    }
    
}
@end
