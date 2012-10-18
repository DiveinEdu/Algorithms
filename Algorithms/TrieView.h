//
//  TrieView.h
//  Algorithms
//
//  Created by Carl Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TrieNode;
@class ArrowView;

@interface TrieView : UIView
@property (nonatomic, strong) NSMutableArray* childrenNodes;
@property (nonatomic, strong) NSMutableArray* arrowViews;
@property (nonatomic, weak)   TrieNode* node;
@property (nonatomic, strong) UILabel* value;

-(id)initWithNode:(TrieNode*)node;

@end
