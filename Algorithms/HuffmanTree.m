//
//  HuffmanTree.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HuffmanTree.h"
#import "ArrayHeap.h"
@implementation HuffmanTree





-(void)buildTreeWithValues:(NSDictionary*)valueMap{
    
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
    return nil;
}
-(NSString*)decodeString:(NSString*)value{
    return nil;
}
@end
