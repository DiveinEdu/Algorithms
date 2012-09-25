//
//  StackViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"

@class StackView;
@class Stack;
@interface StackViewController : DataViewController{
    Stack* stack;
}
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet StackView *stackView;
- (IBAction)pushValue:(id)sender;
- (IBAction)popValue:(id)sender;
- (IBAction)peekValue:(id)sender;

@end
