//
//  Node.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Node.h"
@interface Node ()
@property (nonatomic, strong) id value;
@end

@implementation Node
-(id)initWithValue:(id)value{
    self = [super init];
    if(self !=nil){
        self.value = value;
    }
    return self;
}
-(id)getValue{
    return self.value;
}
-(NSString*)description{
    return [NSString stringWithFormat:@"%@",self.value];
}
@end
