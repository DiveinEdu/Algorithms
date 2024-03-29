//
//  NodeView.h
//  Algorithms
//
//  Created by Carl Wieland on 9/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define kHorizontalNodeWidth  100
#define kHorizontalNodeHeight 40
#define kHorizontalMoveDistance   150

#define kVerticalNodeWidth  100
#define kVerticalNodeHeight 70
#define kVerticalMoveDistance   150


typedef enum{
    NODE_DIRECTION_DOWN,
    NODE_DIRECTION_UP,
    NODE_DIRECTION_RIGHT,
    NODE_DIRECTION_LEFT
}NODE_DIRECTION;


@class ListNode;
@interface NodeView : UIView
@property (nonatomic, strong)UIView* container;
@property ( nonatomic, weak)ListNode* node;

-(id)initWithNode:(ListNode*)node andDirection:(NODE_DIRECTION)direction;
-(void)moveLeft;
-(void)moveRight;
-(void)moveUp;
-(void)moveDown;
@end
