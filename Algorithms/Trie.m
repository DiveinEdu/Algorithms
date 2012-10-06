//
//  Trie.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Trie.h"
#import "TrieNode.h"
@implementation Trie

-(BOOL)addString:(NSString*)value{
    if (self.root == nil) {
        self.root = [[TrieNode alloc] initForRoot];
    }
    [self.root addValue:value];

    return TRUE;
}
-(BOOL)inTree:(NSString*)value{
    return YES;
}
-(NSArray*)suggestionsForString:(NSString*)value{
    return nil;
}


@end
