//
//  TrieNode.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TrieNode.h"
#define BUFFER_SIZE 32

@implementation TrieNode
-(id)initWithValue:(char)value{
    self = [super init];
    if (self) {
        self.value = value;
        self.children = [[NSMutableArray alloc] init];
    }
    return self;
}
-(id)initForRoot{
    self = [super init];
    if (self) {
        self.value =' ';
        self.children = [NSMutableArray new];
    }
    return self;
}
-(void)addValue:(NSString*)value{
    if ([value length] == 0) {
        return;
    }
    
    char myVal = [value characterAtIndex:0];
    TrieNode* child = [self childWithValue:myVal];
    if (child == nil){
        child = [[TrieNode alloc] initWithValue:myVal];
        [self.children addObject:child];
    }
    
    if ([value length]>=2) {
        [child addValue:[value substringFromIndex:1]];
    }
}
-(void)addChild:(TrieNode *)node{
    if (![self.children containsObject:node]) {
        [self.children addObject:node];
    }
}
-(TrieNode*)childWithValue:(char)value{
    if ([self.children count]==0) {
        return nil;
    }
    
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"self.value == %c",value];
    NSMutableArray* children =[NSMutableArray arrayWithArray:self.children];
    [children filterUsingPredicate:pred];
    //if it has a value then it has a child with that value
    return [children lastObject];
}
-(NSString*)description{
    return [NSString stringWithFormat:@"%c",self.value];
}
@end
