//
//  HuffmanNode.h
//  Algorithms
//
//  Created by Carl Wieland on 11/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HeapNode.h"

@interface HuffmanNode : HeapNode
@property (nonatomic, strong)NSString* character;

-(id)initWithValue:(id)value andString:(NSString*)character;
-(id)initWithValue:(id)value;
-(double)weight;
@end

