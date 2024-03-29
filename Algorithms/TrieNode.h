//
//  TrieNode.h
//  Algorithms
//
//  Created by Carl Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrieNode : NSObject
@property (nonatomic) char value;
@property (nonatomic, strong)NSMutableArray* children;
@property (nonatomic) BOOL isTerminal;
-(id)initForRoot;
-(id)initWithValue:(char)value;
-(void)addChild:(TrieNode*)node;
-(TrieNode*)childWithValue:(char)value;
-(void)addValue:(NSString*)string;
-(NSString*)description;
-(BOOL)inTree:(NSString*)value;
-(NSArray*)suggestions:(NSString*)value;
@end
