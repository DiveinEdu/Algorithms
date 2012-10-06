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
    
    AVLNode* tmp =(AVLNode*) node.parent;
    node.parent = x;
    x.parent = tmp;
    // Return new root
    return x;
}
-(AVLNode*)leftRotate:(AVLNode*)node{
    AVLNode* y = (AVLNode*)node.right;
    AVLNode* T2 = (AVLNode*)y.left;
    
    // Perform rotation
    y.left = node;
    node.right = T2;

    AVLNode* tmp =(AVLNode*) node.parent;
    node.parent = y;
    y.parent = tmp;
    // Return new root
    return y;
}
-(AVLNode*)insertNode:(AVLNode*)newNode currentNode:(AVLNode*)node{
    /* 1.  Perform the normal BST rotation */
    if (node == nil)
        return newNode;
    
    if ([newNode compare:node]==NSOrderedAscending)
        node.left  = [self insertNode:newNode currentNode:(AVLNode*)node.left];
    else if ([newNode compare:node]==NSOrderedDescending)
        node.right  = [self insertNode:newNode currentNode:(AVLNode*)node.right];

    if (newNode.parent == nil)
        newNode.parent = node;

    return [self rebalance:newNode parentNode:node];
}


-(AVLNode*)rebalance:(AVLNode*)newNode parentNode:(AVLNode*)node{
    int balance = [node balance];
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
    return node;
}



-(AVLNode*)removeValue:(id)value{
    AVLNode* auxRoot = [[AVLNode alloc] initWithValue:value];
    self.root = [self removeNode:auxRoot withCurrent:self.root];
    return auxRoot;
}
-(AVLNode*)removeNode:(AVLNode*)oldNode withCurrent:(AVLNode*)node{
    if (node == NULL)
        return node;
    
    if ([oldNode compare:self.root] == NSOrderedAscending)
        node.left = [self removeNode:oldNode withCurrent:(AVLNode*)node.left];
    else if([oldNode compare:node] == NSOrderedDescending)
        node.right = [self removeNode:oldNode withCurrent:(AVLNode*)node.right];
    else
    {
        // node with only one child or no child
        if( (node.left == NULL) || (node.right == NULL) )
        {
            TreeNode *temp = node.left ? node.left : node.right;
            
            // No child case
            if(temp == NULL)
            {
                temp = node;
                node = NULL;
            }
            else {
                node.right = temp.right;
                node.left = temp.left;
                node.parent = temp.parent;
                
            }
            
        }
        else
        {
            // node with two children: Get the inorder successor (smallest
            // in the right subtree)
            AVLNode* cur = (AVLNode*)node.right;
            while (cur.left!=nil) {
                cur = (AVLNode*)cur.left;
            }
            if (cur.parent !=node) {
                //cut off the leaf and use it to fill this spot
                cur.parent.left = nil;
                cur.parent = node.parent;
                cur.left = node.left;
                cur.right = node.right;
                if (node == node.parent.left)
                    node.parent.left = cur;
                
                else
                    node.parent.right = cur;
            }
            else{
                if (node == node.parent.left)
                    node.parent.left = cur;
                
                else
                    node.parent.right = cur;
                
                cur.left = node.left;
                //Don't need right case as cur== node.right
                cur.parent = node.parent;
                
                
            }
            node.left = nil;
            node.right = nil;
            node = cur;
        }
    }
    
    // If the tree had only one node then return
    if (node == NULL)
        return node;
    
    // STEP 3: GET THE BALANCE FACTOR OF THIS NODE (to check whether
    //  this node became unbalanced)
    int balance = [node balance];
    
    // If this node becomes unbalanced, then there are 4 cases
    
    // Left Left Case
    if (balance > 1 && [(AVLNode*)node.left balance] >= 0)
        return [self rightRotate:node];
    
    // Left Right Case
    if (balance > 1 && [(AVLNode*)node.left balance] < 0)
    {
        node.left = [self leftRotate:(AVLNode*)node.left];
        return [self rightRotate:node];
    }
    
    // Right Right Case
    if (balance < -1 && [(AVLNode*)node.right balance] <= 0)
        return [self leftRotate:node];
    
    // Right Left Case
    if (balance < -1 && [(AVLNode*)node.right balance] > 0)
    {
        node.right = [self rightRotate:(AVLNode*)node.right];
        return [self  leftRotate:node];
    }
    
    return node;
}
@end
