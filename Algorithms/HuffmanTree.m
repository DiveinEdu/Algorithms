//
//  HuffmanTree.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HuffmanTree.h"
#import "PriorityQueue.h"
#import "HuffmanNode.h"

@implementation HuffmanTree

-(id)init{
    self = [super init];
    if(self){
        priorityQueue = [PriorityQueue new];
        lookups=[NSMutableDictionary new];
    }
    return self;
}

-(void)generateLookups:(HuffmanNode*)node path:(NSMutableString*)currentPath{
    
    if (!(node.left && node.right)) {
        /* we hit a leaf*/
        [lookups setObject:[currentPath copy] forKey:node.character];
    }
    else{
        [currentPath appendString:@"0"];
        [self generateLookups:(HuffmanNode*)node.left path:currentPath];
        //clean off this path
        [currentPath deleteCharactersInRange:NSMakeRange([currentPath length]-1, 1)];
        [currentPath appendString:@"1"];
        [self generateLookups:(HuffmanNode*)node.right path:currentPath];
        [currentPath deleteCharactersInRange:NSMakeRange([currentPath length]-1, 1)];
    }
    
}


-(void)buildTreeWithValues:(NSDictionary*)valueMap{
    for (NSString* key in [valueMap keyEnumerator]) {
        NSNumber* value = valueMap[key];
        NSAssert([value doubleValue]<1, @"Non normalized weight!");
        HuffmanNode* newNode = [[HuffmanNode alloc] initWithValue:value andString:key];
        [priorityQueue addNode:newNode];
    }
    HuffmanNode* left, *right;
    while ([priorityQueue size]>1) {
        left = (HuffmanNode*)[priorityQueue getNext];
        right = (HuffmanNode*)[priorityQueue getNext];
        HuffmanNode* combined = [[HuffmanNode alloc] initWithValue:[NSNumber numberWithDouble:[[left weight]doubleValue] +[[right weight]doubleValue]]];
        [combined setRight:right];
        [combined setLeft:left];
        [priorityQueue addNode:combined];
    }
    self.root = (HuffmanNode*)[priorityQueue getNext];

    [self generateLookups:self.root path:[NSMutableString new]];
}
-(void)buildTreeWithString:(NSString*)value{
    
    NSInteger total=[value length];
    NSParameterAssert(total!=0);
    NSMutableDictionary* valueMap=[NSMutableDictionary new];
    
    unichar buffer[total + 1];
    [value getCharacters:buffer range:NSMakeRange(0, total)];
    /* Count occurances to build probabilities */
    for(int i = 0; i < total; ++i) {
        NSString* key = [NSString stringWithFormat:@"%c", buffer[i]];
        if([valueMap objectForKey:key])
            valueMap[key]=[NSNumber numberWithInt:[valueMap[key] integerValue]+1];
        else
            valueMap[key ]=[NSNumber numberWithInt:1];
        
    }
    /* Normalize */
    for (NSString* key in [[valueMap copy] keyEnumerator]) {
        valueMap[key]=[NSNumber numberWithDouble:[valueMap[key] doubleValue]/total];
    }
    [self buildTreeWithValues:valueMap];
}
-(NSString*)encodeString:(NSString*)value{
    NSMutableString* toReturn = [NSMutableString new];
    NSInteger total=[value length];
    NSParameterAssert(total!=0);
    
    unichar buffer[total + 1];
    [value getCharacters:buffer range:NSMakeRange(0, total)];
    /* Count occurances to build probabilities */
    for(int i = 0; i < total; ++i) {
        NSString* key = [NSString stringWithFormat:@"%c", buffer[i]];
        if(lookups[key]==nil)
            return [NSString stringWithFormat:@"Error! '%@' Not in Tree!",key];
        else
            [toReturn appendString:lookups[key]];
    }
    return toReturn;
}
-(NSString*)decodeString:(NSString*)value{
    return nil;
}
@end
