//
//  Trie.h
//  Algorithms
//
//  Created by Carl Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TrieNode;

@interface Trie : NSObject
@property (nonatomic, strong)TrieNode* root;


-(BOOL)addString:(NSString*)value;
-(BOOL)inTree:(NSString*)value;
-(NSArray*)suggestionsForString:(NSString*)value;
@end
