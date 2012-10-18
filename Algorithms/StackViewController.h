//
//  StackViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"


@class NodeView;
@class Stack;
@interface StackViewController : DataViewController{
    Stack* stack;
}
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UIScrollView *stackView;
@property (nonatomic, strong)NodeView* headView;
- (IBAction)pushValue:(id)sender;
- (IBAction)popValue:(id)sender;
- (IBAction)peekValue:(id)sender;

@end
