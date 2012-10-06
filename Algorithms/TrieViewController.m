//
//  TrieViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TrieViewController.h"
#import "TrieView.h"
#import "Trie.h"

@implementation TrieViewController
-(Trie*)trie{
    if (_trie !=nil) {
        return _trie;
    }
    _trie = [[Trie alloc] init];
    return _trie;
}


- (IBAction)addValue:(id)sender {
    [self.trie addString:[[self.valueField text] lowercaseString]];
    [self refresh];
}
-(void)refresh{
    [self.root removeFromSuperview];
    if (self.trie.root) {
        self.root = [[TrieView alloc] initWithNode:self.trie.root];
        [self.scrollView addSubview:self.root];
        self.scrollView.minimumZoomScale = self.scrollView.frame.size.width / self.root.frame.size.width;
        self.scrollView.maximumZoomScale = 2.0;
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale];
    }
}
- (IBAction)getSuggestions:(id)sender {
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.root;
}
@end
