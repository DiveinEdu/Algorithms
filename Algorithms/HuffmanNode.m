//
//  HuffmanNode.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HuffmanNode.h"

@implementation HuffmanNode
-(id)initWithValue:(id)value andString:(NSString*)character{
    self = [super initWithValue:value andType:HEAP_MIN];//we want the lowest on the top
    if(self){
        self.character=character;
    }
    return self;
}
-(id)initWithValue:(id)value{
    return [self initWithValue:value andString:@""];
    
}
-(NSNumber*)weight{
    return [self getValue];
}
@end
