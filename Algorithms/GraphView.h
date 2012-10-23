//
//  GraphView.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GraphNode;
@interface GraphView : UIView
@property (nonatomic, weak)GraphNode* node;
-(id)initWithNode:(GraphNode*)node;
@end
