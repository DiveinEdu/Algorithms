//
//  RedBlackTree.m
//  Algorithms
//
//  Created btmp Carl Wieland on 10/3/12.
//  Coptmpright (c) 2012 balanceoni. All rights reserved.
//
const BOOL VERIFY_RBTREE=YES;
#import "RedBlackTree.h"
#import "RedBlackNode.h"
@implementation RedBlackTree
-(RedBlackNode*)removeValue:(id)value{
    RedBlackNode* node = [self findValue:value];
    RedBlackNode* toReturn = node;
    if (node == nil)
        return nil;  // Key not found, do nothing
    if (node.left != nil && node.right != nil) {

        RedBlackNode* next = [self sucessor:node];
        //copies pointers to right, left, and parent
        RedBlackNode* temp = [[RedBlackNode alloc] initCopy:next];
        temp.color = next.color;
        if (next ==next.parent.left ) {
            next.parent.left=temp;
        }
        else{
            next.parent.right = temp;
        }
        //attach it in place
        next.left = node.left;
        next.right = (temp == node.right) ? node:node.right;
        next.parent = node.parent;
        if(node == node.parent.left)
            node.parent.left = next;
        else
            node.parent.right = next;
        next.left.parent = next;
        next.right.parent = next;
        
        node.parent = (temp == node.right) ? next:temp.parent;
        if (temp == temp.parent.right)
            temp.parent.right = node;
        else
            temp.parent.left = node;
        node.right = temp.right;
        node.left = temp.left;
        node.left.parent = node;
        node.right.parent = node;
        next.color = node.color;
        node.color = temp.color;
        
    }
    
    NSParameterAssert(node.left == nil || node.right == nil);
    RedBlackNode* child = (node.right == nil) ? node.left : node.right;
    if (node.color == BLACK) {
        node.color = child.color;
        [self deleteCase1:node];
    }
    [self replaceNode:node withNode:child];
    
    if (self.root.color == RED) {
        self.root.color = BLACK;
    }
    
    [self verifyProperties];
    return toReturn;
}
-(RedBlackNode*)sucessor:(RedBlackNode*)node{
    RedBlackNode* cur = node.right;
    while(cur.left !=nil)
        cur = cur.left;
    return cur;
}
-(void)deleteCase1:(RedBlackNode*)node{
    if (node.parent == nil)
        return;
    else
        [self deleteCase2:node];
}
-(void)deleteCase2:(RedBlackNode*)node{
    if ([node sibling].color == RED) {
        node.parent.color = RED;
        [node sibling ].color = BLACK;
        if (node == node.parent.left)
            [self rotateLeft:node.parent];
        else
            [self rotateRight:node.parent];
    }
    [self deleteCase3:node];
}
-(void)deleteCase3:(RedBlackNode*)node{
    if (node.parent.color == BLACK &&
        [node sibling].color == BLACK &&
        [node sibling].left.color == BLACK &&
        [node sibling].right.color == BLACK)
    {
        [node sibling ].color = RED;
        [self deleteCase1:node.parent];
    }
    else
        [self deleteCase4:node];
}
-(void)deleteCase4:(RedBlackNode*)node{
    if (node.parent.color == RED &&
        [node sibling].color == BLACK &&
        [node sibling].left.color == BLACK &&
        [node sibling].right.color == BLACK)
    {
        [node sibling].color = RED;
        node.parent.color = BLACK;
    }
    else
        [self deleteCase5:node];

}
-(void)deleteCase5:(RedBlackNode*)node{
    if (node== node.parent.left &&
        [node sibling].color == BLACK &&
        [node sibling].left.color == RED &&
        [node sibling].right.color == BLACK)
    {
        [node sibling].color = RED;
        [node sibling].left.color = BLACK;
        [self rotateRight:[node sibling]];
    }
    else if (node== node.parent.right &&
             [node sibling].color == BLACK &&
        [node sibling].right.color == RED &&
        [node sibling].left.color == BLACK)
    {
        [node sibling].color = RED;
        [node sibling].right.color = BLACK;
        [self rotateLeft:[node sibling]];
    }
    [self deleteCase6:node];
}
-(void)deleteCase6:(RedBlackNode*)node{
    [node sibling].color = node.parent.color;
    node.parent.color = BLACK;
    if (node== node.parent.left) {
        NSParameterAssert([node sibling].right.color == RED);
        [node sibling].right.color = BLACK;
        [self rotateLeft:node.parent];
    }
    else
    {
        NSParameterAssert([node sibling].left.color == RED);
        [node sibling].left.color = BLACK;
        [self rotateRight:node.parent];
    }

}


-(BOOL)addValue:(id)value{
    RedBlackNode* insertedNode = [[RedBlackNode alloc] initWithValue:value andColor:RED ];
    if (self.root == nil) {
        self.root = insertedNode;
    } else {
        RedBlackNode* n = self.root;
        BOOL placed = NO;
        while (!placed) {
            switch ([n compare:insertedNode]) {
                case NSOrderedAscending:
                    if (n.right == nil) {
                        n.right = insertedNode;
                        placed = YES;
                    } else {
                        n = n.right;
                    }

                    break;
                case NSOrderedDescending:
                    if (n.left == nil) {
                        n.left = insertedNode;
                        placed = YES;
                    } else {
                        n = n.left;
                    }
                    break;
                case NSOrderedSame:
                    return FALSE;
                default:
                    break;
            }

        }
        insertedNode.parent = n;
    }
    [self insertCase1:insertedNode];
    [self verifyProperties];
    return YES;
}
-(void)insertCase1:(RedBlackNode*)node{
    if (node.parent == nil)
        node.color = BLACK;
    else
        [self insertCase2:node];
}
-(void)insertCase2:(RedBlackNode*)node{
    if (node.parent.color == BLACK)
        return; // Tree is still valid
    else
        [self insertCase3:node];
}
-(void)insertCase3:(RedBlackNode*)node{
    if ([node uncle].color == RED) {
        node.parent.color = BLACK;
        [node uncle].color = BLACK;
        [node grandparent].color = RED;
        [self insertCase1:[node grandparent]];
    } else {
        [self insertCase4:node];
        
    }

}
-(void)insertCase4:(RedBlackNode*)node{
    if (node == node.parent.right && node.parent == [node grandparent].left) {
        [self rotateLeft:node.parent];
        node = node.left;
    } else if (node == node.parent.left && node.parent == [node grandparent].right) {
        [self rotateRight:node.parent];
        node = node.right;
    }
    [self insertCase5:node];
}
-(void)insertCase5:(RedBlackNode*)node{
    node.parent.color = BLACK;
    [node grandparent].color = RED;
    if (node == node.parent.left && node.parent == [node grandparent].left) {
        [self rotateRight:[node grandparent]];
    } else {
        NSParameterAssert(node == node.parent.right && node.parent == [node grandparent].right);
        [self rotateLeft:[node grandparent]];
    }
}



-(void)replaceNode:(RedBlackNode*)oldNode withNode:(RedBlackNode*)newNode{
    if (oldNode.parent == nil) {
        self.root = newNode;
    } else {
        if (oldNode == oldNode.parent.left)
            oldNode.parent.left = newNode;
        else
            oldNode.parent.right = newNode;
    }
    if (newNode != nil) {
        newNode.parent = oldNode.parent;
    }

}

-(void)rotateRight:(RedBlackNode*)node{
    RedBlackNode* left = node.left;
    [self replaceNode:node withNode:left];
    node.left = left.right;
    if (left.right != nil) {
        left.right.parent = node;
    }
    left.right = node;
    node.parent = left;

    
}
-(void)rotateLeft:(RedBlackNode*)node{
    
    RedBlackNode* right = node.right;
    [self replaceNode:node withNode:right];
    node.right = right.left;
    if (right.left != nil) {
        right.left.parent = node;
    }
    right.left = node;
    node.parent = right;
}

-(RedBlackNode*)findValue:(id)value{
    RedBlackNode* node = [[RedBlackNode alloc] initWithValue:value andColor:BLACK];
    return [self findNode:node atLocation:self.root];
    
}
-(RedBlackNode*)findNode:(RedBlackNode*)node atLocation:(RedBlackNode*)parent{
    switch ([parent compare:node]) {
        case NSOrderedAscending:
            //node value is greater than parent
            return [self findNode:node atLocation:parent.right];
            break;
        case NSOrderedDescending:
            //node value is less than parent
            return [self findNode:node atLocation:parent.left];
            break;
        case NSOrderedSame:
            //found
            return parent;
            break;
        default:
            return nil;
            break;
    }
}



#pragma mark -
#pragma mark Tree Verification
-(void)verifyProperty1:(RedBlackNode*)node{
    if (node == nil) {
        return;
    }
    NSParameterAssert(node.color == RED || node.color == BLACK);
    [self verifyProperty1:node.left];
    [self verifyProperty1:node.right];
}
-(void)verifyProperty2{
    NSParameterAssert(self.root.color == BLACK);
}
-(void)verifyProperty4:(RedBlackNode*)node{
    if (node) {
        if (node.color == RED) {
            NSParameterAssert(node.left.color == BLACK);
            NSParameterAssert(node.right.color == BLACK);
            NSParameterAssert(node.parent.color == BLACK);
        }
        [self verifyProperty4:node.left];
        [self verifyProperty4:node.right];
    }

    
}
-(void)verifyProperty5:(RedBlackNode*)node{
    [self validateProperty5:node withBlackCount:0 andPathCount:-1];
}
-(NSInteger)validateProperty5:(RedBlackNode*)node withBlackCount:(NSInteger)blackCount andPathCount:(NSInteger)pathBlackCount{
    if (node.color == BLACK) {
                 blackCount++;
    }
    if (node == nil) {
            if (pathBlackCount == -1) {
                    pathBlackCount = blackCount;
           } else {
                   NSParameterAssert( blackCount == pathBlackCount);
            }
            return pathBlackCount;
    }
    pathBlackCount = [self validateProperty5:node.left withBlackCount:blackCount andPathCount:pathBlackCount];
    pathBlackCount = [self validateProperty5:node.right withBlackCount:blackCount andPathCount:pathBlackCount];
    return pathBlackCount;
}

-(void)verifyProperties{
    if (VERIFY_RBTREE) {
        [self verifyProperty1:self.root];
        [self verifyProperty2];
        [self verifyProperty4:self.root];
        [self verifyProperty5:self.root];
    }
}


@end
