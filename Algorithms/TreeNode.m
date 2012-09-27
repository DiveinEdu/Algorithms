//
//  TreeNode.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode
-(BOOL)addNode:(TreeNode *)node{
    switch ([node compare:self]) {
        case NSOrderedAscending:
            if (self.right == nil){
                self.right = node;
                node.parent = self;
                return YES;
            }
            else
                return [self.right addNode:node];
        case NSOrderedDescending:
            if  (self.left==nil){
                self.left = node;
                node.parent = self;
                return YES;
            }
            else
                return [self.left addNode:node];
        case NSOrderedSame:
            return false;
    }
}
-(TreeNode*)removeNode:(TreeNode *)node{
    switch ([node compare:self]) {
        case NSOrderedDescending:
            if (self.left != NULL)
                return [self.left removeNode:node] ;
            else
                return nil;
        case NSOrderedAscending:
            if (self.right != NULL)
                return [self.right removeNode:node ];
            else
                return nil;
        case NSOrderedSame:
            //I am need to remove myself!
            
            
            if (self.left != NULL && self.right != NULL) {
                //we find the lowest node on the right
                TreeNode* cur = self.right;
                while (cur.left!=nil) {
                    cur = cur.left;
                }
                if (cur.parent !=self) {
                    //cut cur off and replace this node
                    cur.parent.left = nil;
                    cur.parent = self.parent;
                    cur.left = self.left;
                    cur.right = self.right;
                }
                else{
                    if (self == self.parent.left)
                        self.parent.left = cur;

                    else
                        self.parent.right = cur;
                    
                    cur.left = self.left;
                    cur.parent = self.parent;
                    self.left = nil;
                    self.right = nil;

                }

                
                return self;
            } else if (self.parent.left == self) {
                self.parent.left = (self.left != NULL) ? self.left : self.right;
                return self;
            } else if (self.parent.right == self) {
                self.parent.right = (self.left != NULL) ? self.left : self.right;
                return self;
            }
        default:
            return nil;
            break;
    }
    
}
@end
