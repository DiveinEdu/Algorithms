//
//  HeapView.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/30/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeapNode;
@class ArrowView;

@interface HeapView : UIView
@property (nonatomic, weak)HeapNode* node;
@property (nonatomic, strong)UILabel* value;
@property (nonatomic, strong)HeapView* left;
@property (nonatomic, strong)HeapView* right;
@property (nonatomic, strong)ArrowView* rightArrow;
@property (nonatomic, strong)ArrowView* leftArrow;

-(id)initWithNode:(HeapNode*)node;
-(void)fixViews;
@end
