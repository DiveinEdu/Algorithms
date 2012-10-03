//
//  RedBlackTree.m
//  Algorithms
//
//  Created btmp Carl Wieland on 10/3/12.
//  Coptmpright (c) 2012 balanceoni. All rights reserved.
//

#import "RedBlackTree.h"
#import "RedBlackNode.h"
@implementation RedBlackTree

-(BOOL)addValue:(id)value{
    RedBlackNode* node = [[RedBlackNode alloc] initWithValue:value andColor:BLACK];
    
    if(self.root == nil){
        self.root = node;
        return TRUE;
    }
    else{
        if([self.root addNode:node]){
            [self reorient:node];
            return true;
        }
    }
    return false;
}
-(void)reorient:(RedBlackNode*)node{
    RedBlackNode* tmp;
    while (node.parent.color == RED) {
        if(node.parent == node.parent.parent.left)
        {
            tmp = node.parent.parent.right;
            if(tmp.color == RED)
            {
                node.parent.color = BLACK;
                tmp.color = BLACK;
                node.parent.parent.color = RED;
                node = node.parent.parent;
            }
            else
            {
                if( node == node.parent.right)
                {
                    node = node.parent;
                    [self rotateLeft:node];
                }
                node.parent.color = BLACK;
                node.parent.parent.color = BLACK;
                [self rotateLeft:node.parent.parent];
            }
        }
        else
        {
            tmp = node.parent.parent.left;
            if(tmp.color == RED)
            {
                node.parent.color =BLACK;
                tmp.color = BLACK;
                node.parent.parent.color =RED;
                node = node.parent.parent;
            }
            else
            {
                if( node == node.parent.left)
                {
                    node = node.parent;
                    [self rotateRight:node];
                }
                node.parent.color = BLACK;
                node.parent.parent.color = RED;
                [self rotateLeft:node.parent.parent];
            }
        }
    }
    self.root.color = BLACK;
    
    
}
-(void)rotateLeft:(RedBlackNode*)node{
    // Method to perform a Left Rotation at Node z. Takes a node pointer
    // as a parameter. Returns void.
    
    RedBlackNode *tmp;
    tmp = node.right;
    node.right = tmp.left;
    if (tmp.left != nil) {
        tmp.left.parent = node;
    }
    tmp.parent = node.parent;
    if (node.parent == nil){
        self.root = tmp;
    }
    else
    {
        if (node == node.parent.left) {
            node.parent.left = tmp;
        }
        else {
            node.parent.right = tmp;
        }
    }
    tmp.left = node;
    node.parent = tmp;
    
}
-(void)rotateRight:(RedBlackNode*)node{
    
    RedBlackNode *tmp; // tmp is node's left child
    tmp = node.left;
    node.left = tmp.right;
    if (tmp.right != nil) {tmp.right.parent = node;}
    tmp.parent = node.parent;
    if (node.parent == nil) {self.root = tmp;}
    else
    {
        if (node == node.parent.right) {node.parent.right = tmp;}
        else {node.parent.left = tmp;}
    }
    tmp.right = node;
    node.parent = tmp;
}
-(RedBlackNode*)removeValue:(id)value{
    return nil;
}
@end
