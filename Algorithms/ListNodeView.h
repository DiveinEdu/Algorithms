//
//  ListNodeView.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class Node;
@interface ListNodeView : UIView
@property ( nonatomic, weak)Node* node;

-(id)initWithNode:(Node*)node;
-(void)moveRight;
-(void)moveLeft;
@end
