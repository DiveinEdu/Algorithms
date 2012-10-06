//
//  TrieViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeViewController.h"
@class Trie;
@class TrieView;

@interface TrieViewController : TreeViewController
@property (nonatomic, strong)TrieView* root;
@property (nonatomic, strong)Trie* trie;
- (IBAction)addValue:(id)sender;
- (IBAction)getSuggestions:(id)sender;

@end
