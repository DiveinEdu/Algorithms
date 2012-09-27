//
//  BSTView.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TreeNode;
@class ArrowView;
@interface BSTView : UIView
@property (nonatomic, strong)BSTView* left;
@property (nonatomic, strong)BSTView* right;
@property (nonatomic, weak) BSTView* parent;
@property (nonatomic, weak) TreeNode* node;
@property (nonatomic, strong)UILabel* value;
@property (nonatomic, strong)ArrowView* rightArrow;
@property (nonatomic, strong)ArrowView* leftArrow;
-(id)initWithNode:(TreeNode*)node;
-(void)addBSTView:(BSTView*)view;
-(BOOL)removeNode:(TreeNode*)node;
@end
