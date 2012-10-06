//
//  TreeView.h
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TreeNode;
@class ArrowView;
@interface TreeView : UIView
@property (nonatomic, strong)TreeView* left;
@property (nonatomic, strong)TreeView* right;
@property (nonatomic, weak) TreeNode* node;
@property (nonatomic, strong)UILabel* value;
@property (nonatomic, strong)ArrowView* rightArrow;
@property (nonatomic, strong)ArrowView* leftArrow;
-(id)initWithNode:(TreeNode*)node;
-(void)fixViews;
@end
