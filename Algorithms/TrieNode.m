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
-(BOOL)inTree:(NSString*)value{
    char first = [value characterAtIndex:0];
    TrieNode* next =[self childWithValue:first];
    if (next!=nil) {
        if ([value length]>=2) {
            return [next inTree:[value substringFromIndex:1]];
        }
        return true;
    }
    else
        return false;
    
}
-(NSMutableArray*) allSubs{
    NSMutableArray* words = [NSMutableArray new];
    for (TrieNode* node in self.children) {
        [words addObject:[node allSubs]];
    }
    if ([words count] == 0) {
        [words addObject:[NSString stringWithFormat:@"%c",self.value]];
        return words;
    }
    NSMutableArray* final = [NSMutableArray new];
    for (NSMutableArray* array in words) {
        for (NSString* prefix in array) {
            [final addObject:[NSString stringWithFormat:@"%c%@",self.value,prefix]];
        }
    }
    return final;
}
-(NSArray*)suggestions:(NSString*)value{
    if ([value length]==1) {
        char last = [value characterAtIndex:0];
        TrieNode* lastNode = [self childWithValue:last];
        NSArray* array = [lastNode allSubs];
        if (self.value == ' ') {
            return array;
        }
        else{
            NSMutableArray* final=[NSMutableArray new];
            for (NSString* str in array) {
                [final addObject:[NSString stringWithFormat:@"%c%@",self.value,str]];
            }
            return final;
        }
    }
    else{
        char next = [value characterAtIndex:0];
        TrieNode* lastNode = [self childWithValue:next];
        if (lastNode == nil) {
            return nil;
        }
        else{
            NSArray* array = [lastNode suggestions:[value substringFromIndex:1]];
            if (self.value == ' ') {
                return array;
            }
            else{
                NSMutableArray* final = [NSMutableArray new];
                for (NSString* str in array) {
                    [final addObject:[NSString stringWithFormat:@"%c%@",self.value,str]];
                }
                return final;
            }
        }

    }
}
-(NSString*)description{
    return [NSString stringWithFormat:@"%c",self.value];
}
@end
