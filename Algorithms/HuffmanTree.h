//
//  HuffmanTree.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ArrayHeap;
@interface HuffmanTree : NSObject{
    ArrayHeap* priorityQueue;
}

-(void)buildTreeWithValues:(NSDictionary*)valueMap;
-(void)buildTreeWithString:(NSString*)value;
-(NSString*)encodeString:(NSString*)value;
-(NSString*)decodeString:(NSString*)value;
@end
