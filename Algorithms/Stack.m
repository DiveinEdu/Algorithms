//
//  Stack.m
//  Algorithms
//
//  Created by Carl Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Stack.h"
#import "Node.h"

@interface Stack ()
@property ( nonatomic, strong)Node* top;

@end

@implementation Stack

-(void)push:(Node*)node{
    node.next=self.top;
    self.top=node;
}
-(Node*)pop{
    Node* oldTop = self.top;
    self.top=[self.top next];
    return oldTop;
}
-(Node*)peek{
    return self.top;
}

@end
