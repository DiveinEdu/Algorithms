//
//  HeapView.h
//  Algorithms
//
//  Created by Carl Wieland on 9/30/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeView.h"
@class HeapNode;
@class ArrowView;

@interface HeapView : TreeView
@property (nonatomic, strong)UILabel* value;
@property (nonatomic, strong)HeapView* left;
@property (nonatomic, strong)HeapView* right;
@property (nonatomic, strong)ArrowView* rightArrow;
@property (nonatomic, strong)ArrowView* leftArrow;

-(id)initWithNode:(HeapNode*)node;
@end
