//
//  GraphNode.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "GraphNode.h"
@interface GraphNode()
@property (nonatomic, strong)id value;
@end

@implementation GraphNode
-(id)initWithValue:(id)value{
    self =[super init];
    if(self){
        self.value = value;
    }
    return self;
}
-(NSString*)description{
    return [NSString stringWithFormat:@"%@",self.value];
}
@end
