//
//  TrieViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 10/6/12.
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
- (IBAction)buildTree:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *suggestionField;
@property (nonatomic, strong)NSMutableArray* words;

@end
