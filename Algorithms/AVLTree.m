//
//  AVLTree.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "AVLTree.h"
#import "AVLNode.h"
@implementation AVLTree


-(BOOL)addValue:(id)value{
    AVLNode* node = [[AVLNode alloc] initWithValue:value ];
    self.root = [self insertNode:node currentNode:self.root];
    return TRUE;
}



-(AVLNode*)rightRotate:(AVLNode*)node{
    AVLNode *x = (AVLNode*)node.left;
    AVLNode *T2 = (AVLNode*)x.right;
    
    // Perform rotation
    x.right = node;
    node.left = T2;
    
    // Return new root
    return x;
}
-(AVLNode*)leftRotate:(AVLNode*)node{
    AVLNode* y = (AVLNode*)node.right;
    AVLNode* T2 = (AVLNode*)y.left;
    
    // Perform rotation
    y.left = node;
    node.right = T2;

    // Return new root
    return y;
}
-(AVLNode*)insertNode:(AVLNode*)newNode currentNode:(AVLNode*)node{
    /* 1.  Perform the normal BST rotation */
    if (node == nil)
        return newNode;
    
    if ([newNode compare:node]==NSOrderedAscending)
        node.left  = [self insertNode:newNode currentNode:(AVLNode*)node.left];
    else
        node.right  = [self insertNode:newNode currentNode:(AVLNode*)node.right];
    
    /* 2. Update height of this ancestor node */

    /* 3. Get the balance factor of this ancestor node to check whether
     this node became unbalanced */
    int balance = [node balance];
    
    // If this node becomes unbalanced, then there are 4 cases
    
    // Left Left Case
    if (!balance > 1 && [newNode compare:node.left]==NSOrderedAscending)
        return [self rightRotate:node];
    
    // Right Right Case
    if (balance < -1 && [newNode compare:node.right]==NSOrderedDescending)
        return [self leftRotate:node];
    
    // Left Right Case
    if (balance > 1 && [newNode compare:node.left]==NSOrderedDescending)
    {
        node.left =  [self leftRotate:(AVLNode*)node.left];
        return [self rightRotate:node];
    }
    
    // Right Left Case
    if (balance < -1 && [newNode compare:node.right]== NSOrderedAscending)
    {
        node.right =[self rightRotate:(AVLNode*)node.right];
        return [self leftRotate:node];
    }
    
    /* return the (unchanged) node pointer */
    return node;
}



-(AVLNode*)removeValue:(id)value{
    return nil;
    
}

@end
