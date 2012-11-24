//
//  HuffmanTree.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PriorityQueue;
@class HuffmanNode;

@interface HuffmanTree : NSObject{
    PriorityQueue* priorityQueue;
    NSMutableDictionary* lookups;
}
@property (nonatomic, strong)HuffmanNode* root;
-(void)buildTreeWithValues:(NSDictionary*)valueMap;
-(void)buildTreeWithString:(NSString*)value;
-(NSString*)encodeString:(NSString*)value;
-(NSString*)decodeString:(NSString*)value;
@end
