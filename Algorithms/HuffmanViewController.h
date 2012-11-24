//
//  HuffmanViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HeapViewController.h"
@class HuffmanTree;
@class HuffmanView;
@interface HuffmanViewController : HeapViewController
@property (nonatomic, strong)HuffmanTree* tree;
@property (nonatomic, strong)HuffmanView* rootView;
@end
