//
//  RedBlackNode.m
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "RedBlackNode.h"


@implementation RedBlackNode
-(id)initWithValue:(id)value andColor:(NODE_COLOR)color{
    self = [super initWithValue:value];
    if (self) {
        self.color = color;
    }
    return self;
}

@end
