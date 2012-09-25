//
//  DoublyLinkedListView.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListNode;
@interface DoublyLinkedListView : UIScrollView
@property (nonatomic, strong)NSMutableArray* nodeViews;
@property (nonatomic, strong)NSMutableArray* arrowViews;

-(void)addNode:(ListNode*)node;
-(void)removeNode;


@end
