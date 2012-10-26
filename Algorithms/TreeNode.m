//
//  TreeNode.m
//  Algorithms
//
//  Created by Carl Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode
-(BOOL)addNode:(TreeNode *)node{
    switch ([self compare:node]) {
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
-(TreeNode*)successor{
    TreeNode* toReturn = nil;
    if ((toReturn = self.right) !=nil ) {
        while(toReturn.left != nil) { /* returns the minium of the right subtree of x */
            toReturn=toReturn.left;
        }
        return toReturn;
    } else {
        toReturn=self.parent;
        TreeNode* tmp = self;
        while(tmp == toReturn.right) { /* sentinel used instead of checking for nil */
            tmp=toReturn;
            toReturn=toReturn.parent;
        }
        if (toReturn.parent == nil) return(nil);
        return toReturn;
    }
}
-(TreeNode*)removeNode:(TreeNode *)node{
    switch ([self compare:node]) {
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
            if (self.left == nil || self.right == nil) {
                TreeNode *temp = self.left ? self.left : self.right;
                
                // No child case
                if(temp == nil)
                {
                    if (self == self.parent.left)
                        self.parent.left = nil;
                    else
                        self.parent.right = nil;
                    return self;
                }
                else {
                    //have only one child so it replaces my spot
                    temp.parent = self.parent;
                    if (self == self.parent.left) {
                        self.parent.left=temp;
                    }
                    else{
                        self.parent.right = temp;
                    }
                    return self;
                }
            }
            else{
                //Two kids!
                TreeNode* cur = self.right;
                while (cur.left!=nil) {
                    cur = cur.left;
                }
                if (cur.parent == self) {
                    //just my right child
                    if (self == self.parent.left)
                        self.parent.left = cur;
                    else
                        self.parent.right = cur;

                    cur.parent = self.parent;
                    cur.left = self.left;
                    cur.left.parent = cur;

 
                }
                else{
                    //cut off the leaf and use it to fill my spot
                    //fix my subtree
                    cur.parent.left = cur.right;
                    cur.right.parent = cur.parent;

                    //fix replace self
                    cur.parent = self.parent;
                    cur.left = self.left;
                    self.left.parent = cur;
                    cur.right = self.right;
                    self.right.parent = cur;
                    
                    if (self == self.parent.left)
                        self.parent.left = cur;
                    else
                        self.parent.right = cur;
                }
                return self;
            }
            break;
        default:
            return nil;
            break;
    }
    
}
@end
