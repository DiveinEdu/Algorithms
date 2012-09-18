//
//  Node.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Node.h"
@interface Node ()
@property (nonatomic) int value;
@end

@implementation Node
-(id)initWithValue:(int)value{
    self = [super init];
    if(self !=nil){
        self.value = value;
    }
    return self;
}
-(int)getValue{
    return self.value;
}
-(NSString*)description{
    return [NSString stringWithFormat:@"Node: %i",self.value];
}
@end
