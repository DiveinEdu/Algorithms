//
//  AVLNode.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "AVLNode.h"

@implementation AVLNode
-(id)initWithValue:(id)value andHeight:(NSInteger)height{
    self=[super initWithValue:value];
    if (self) {
        self.height = height;
    }
    return self;
}
-(id)initWithValue:(id)value{
    self=[super initWithValue:value];
    if (self) {
        self.height = 1;
    }
    return self;
}

-(NSInteger)height{
    if (self.left == nil && self.right == nil) {
        return 1;
    }
    NSInteger left = self.left == nil? 0:[(AVLNode*)self.left height];
    NSInteger right = self.right == nil? 0:[(AVLNode*)self.right height];
    
    return MAX(left,right)+1;
}
-(NSInteger)balance{
    NSInteger left = [(AVLNode*)self.left height];
    NSInteger right = [(AVLNode*)self.right height];
    return left - right;

}



@end
