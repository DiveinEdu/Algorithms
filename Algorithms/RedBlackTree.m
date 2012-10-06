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
    RedBlackNode* toRemove =[self findNodeWithValue:value];

    [self removeNode:toRemove];
    return toRemove;

}

-(RedBlackNode*)findNodeWithValue:(id)value{
    RedBlackNode* node = [[RedBlackNode alloc] initWithValue:value andColor:RED];

    RedBlackNode* toReturn = self.root;
    BOOL found = NO;
    while (!found) {
        switch ([node compare:toReturn]) {
            case NSOrderedAscending:
                toReturn = toReturn.left;
                break;
            case NSOrderedDescending:
                toReturn = toReturn.right;
                break;
            case NSOrderedSame:
                found = true;
            default:
                break;
        }
        if (toReturn == nil) {
            found = YES;
        }
    }
    return toReturn;
}

-(RedBlackNode*)removeNode:(RedBlackNode*)node {
    RedBlackNode* y;
    RedBlackNode* x;
    
    y = (RedBlackNode*)(((node.left == nil) || (node.right == nil)) ? node : [node successor]);
    x = (RedBlackNode*)((y.left == nil) ? y.right : y.left);
    if (self.root == (x.parent = y.parent)) { /* assignment of y.p to x.p is intentional */
        self.root.left=x;
    } else {
        if (y == y.parent.left) {
            y.parent.left=x;
        } else {
            y.parent.right=x;
        }
    }
    if (y != node) { /* y should not be nil in this case */
        /* y is the node to splice out and x is its child */
        
        if ([y color]!=RED)
            [self fixDelete:x];
    
        y.left=node.left;
        y.right=node.right;
        y.parent=node.parent;
        y.color = node.color;
        node.left.parent=node.right.parent=y;
        if (node == node.parent.left) {
            node.parent.left=y;
        } else {
            node.parent.right=y;
        }
    } else {

        if ([y color]!=RED)
            [self fixDelete:x];

    }
    return node;
}



-(RedBlackNode*)fixDelete:( RedBlackNode *)node
{
    RedBlackNode *w;
    
    while ( node != self.root && node.color == BLACK )
    {
        if ( node == node.parent.left )
        {
            w = node.parent.right;
            
            if ( w.color == RED )
            {
                w.color = BLACK;
                node.parent.color = RED;
                [self rotateLeft:node.parent];
                w = node.parent.right;
            }
            
            if ( w.left.color == BLACK && w.right.color == BLACK )
            {
                w.color = RED;
                node = node.parent;
            }
            else if ( w.right.color == BLACK )
            {
                w.left.color = BLACK;
                w.color = RED;
                [self rotateRight:w];
                w = node.parent.right;
            }
            
            w.color = node.parent.color;
            node.parent.color = BLACK;
            w.right.color = BLACK;
            [self rotateLeft:node.parent];
            node = self.root;
        }
        else
        {
            w = node.parent.left;
            
            if ( w.color == RED )
            {
                w.color = BLACK;
                node.parent.color = RED;
                [self rotateRight:node.parent];
                w = node.parent.left;
            }
            
            if ( w.right.color == BLACK && w.left.color == BLACK )
            {
                w.color = RED;
                node = node.parent;
            }
            else if ( w.left.color == BLACK )
            {
                w.right.color = BLACK;
                w.color = RED;
                [self rotateLeft: w];
                w = node.parent.left;
            }
            
            w.color = node.parent.color;
            node.parent.color = BLACK;
            w.left.color = BLACK;
            [self rotateRight:node.parent];
            node = self.root;
        }
    }
    
    node.color = BLACK;
    
    return 0;
}



@end
