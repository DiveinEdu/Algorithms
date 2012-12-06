//
//  GraphView.h
//  Algorithms
//
//  Created by Carl Wieland on 10/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GraphNode;


@interface GraphView : UIControl
@property (nonatomic, weak)GraphNode* node;
@property (nonatomic) BOOL shouldHighlight;
@property (nonatomic, strong)UILabel* value;
-(id)initWithNode:(GraphNode*)node;
-(void)refresh;
@end
