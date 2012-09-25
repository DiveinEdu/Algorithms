//
//  LinkedListView.h
//  Algorithms
//
//  Created by Carl Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Node;
@interface LinkedListView : UIScrollView
@property (nonatomic, strong)NSMutableArray* nodeViews;
@property (nonatomic, strong)NSMutableArray* arrowViews;

-(void)addNode:(Node*)node;
-(void)removeNode;

@end
