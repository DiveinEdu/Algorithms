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
    RedBlackNode* node = [[RedBlackNode alloc] initWithValue:value andColor:RED];
    
    if(self.root == nil){
        self.root = node;
        self.root.color = BLACK;
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
    RedBlackNode* tmp=nil;
    while ( (node != self.root) && (node.parent.color == RED) ) {
        if ( node.parent == node.parent.parent.left ) {
            tmp = node.parent.parent.right;
            if ( tmp.color == RED ) {
                /* case 1 - change the colours */
                node.parent.color = BLACK;
                tmp.color = BLACK;
                node.parent.parent.color = RED;
                /* Move x up the tree */
                node = node.parent.parent;
            }
            else {
                /* y is a black node */
                if ( node == node.parent.right ) {
                    /* and x is to the right */
                    /* case 2 - move x up and rotate */
                    node = node.parent;
                    [self rotateLeft:node];
                }
                /* case 3 */
                node.parent.color = BLACK;
                node.parent.parent.color = RED;
                [self rotateRight: node.parent.parent ];
            }
        }
        else {
            /* repeat the "if" part with right and left
             exchanged */
            tmp = node.parent.parent.left;
            if ( tmp.color == RED ) {
                /* case 1 - change the colours */
                node.parent.color = BLACK;
                tmp.color = BLACK;
                node.parent.parent.color = RED;
                /* Move x up the tree */
                node = node.parent.parent;
            }
            else {
                /* y is a black node */
                if ( node == node.parent.left ) {
                    /* and x is to the right */
                    /* case 2 - move x up and rotate */
                    node = node.parent;
                    [self rotateRight:node];
                }
                /* case 3 */
                node.parent.color = BLACK;
                node.parent.parent.color = RED;
                [self rotateLeft: node.parent.parent ];
            }
        }
    }
    self.root.color = BLACK;

}

    

-(void)rotateLeft:(RedBlackNode*)node{
    RedBlackNode* tmp;
    tmp = node.right;
    /* Turn y's left sub-tree into x's right sub-tree */
    node.right = tmp.left;
    if ( tmp.left != NULL )
        tmp.left.parent = node;
    /* y's new parent was x's parent */
    tmp.parent = node.parent;
    /* Set the parent to point to y instead of x */
    /* First see whether we're at the root */
    if ( node.parent == NULL ) self.root = tmp;
    else
        if ( node == node.parent.left )
        /* x was on the left of its parent */
            node.parent.left = tmp;
        else
        /* x must have been on the right */
            node.parent.right = tmp;
    /* Finally, put x on y's left */
    tmp.left = node;
    node.parent = tmp;

}
-(void)rotateRight:(RedBlackNode*)node{
    
    RedBlackNode* tmp;
    tmp = node.left;
    /* Turn y's left sub-tree into x's right sub-tree */
    node.left = tmp.right;
    if ( tmp.right != NULL )
        tmp.right.parent = node;
    /* y's new parent was x's parent */
    tmp.parent = node.parent;
    /* Set the parent to point to y instead of x */
    /* First see whether we're at the root */
    if ( node.parent == NULL ) self.root = tmp;
    else
        if ( node == node.parent.right )
        /* x was on the left of its parent */
            node.parent.right = tmp;
        else
        /* x must have been on the right */
            node.parent.left = tmp;
    /* Finally, put x on y's left */
    tmp.right = node;
    node.parent = tmp;
}
-(RedBlackNode*)removeValue:(id)value{
    return nil;
}
@end
