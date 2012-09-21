//
//  ListNodeView.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#define kListNodeWidth  100
#define kListNodeHeight 40
#define kMoveDistance   150

@class Node;
@interface ListNodeView : UIView
@property ( nonatomic, weak)Node* node;

-(id)initWithNode:(Node*)node;
-(void)moveRight;
-(void)moveLeft;
@end
