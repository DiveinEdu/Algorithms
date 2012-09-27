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
    [self traverse];
    TreeNode* node = [[TreeNode alloc] initWithValue:value];
    if(self.root == nil){
        self.root = node;
        return node;
    }
    else{
        if([self.root addNode:node])
            return node;
        else return nil;
    }
    [self traverse];    
}


-(TreeNode*)removeValue:(id)value{
    TreeNode* removed = nil;
    [self traverse];
    if (self.root == nil)
        removed= self.root;
    else {
        TreeNode* auxRoot = [[TreeNode alloc] initWithValue:value];

        if ([[self.root getValue] integerValue] == [value integerValue]) {
            TreeNode* tmpRoot = [[TreeNode alloc] initWithValue:0];
            tmpRoot.left = self.root;
            self.root.parent = tmpRoot;
            removed = [self.root removeNode:auxRoot];
            self.root = tmpRoot.left;

        } else {
            removed=[self.root removeNode:auxRoot];
        }
    }
    [self traverse];
    return removed;
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
