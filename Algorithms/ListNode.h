//
//  Node.h
//  Algorithms
//
//  Created by Carl Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Node.h"

@interface ListNode : Node{
}

@property ( nonatomic, strong) ListNode* next;
@property ( nonatomic, weak) ListNode* previous;

@end
