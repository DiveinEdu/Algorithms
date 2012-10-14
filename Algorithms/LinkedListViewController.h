//
//  LinkedListViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "DataViewController.h"
@class LinkedList;
@class NodeView;
@interface LinkedListViewController :DataViewController {
    
}
@property (nonatomic, strong) NodeView* headView;
@property (weak, nonatomic) IBOutlet UITextField *insertValueField;
@property (weak, nonatomic) IBOutlet UIScrollView *detailView;
- (IBAction)addValue:(id)sender;
- (IBAction)removeFront:(id)sender;
- (IBAction)showCode:(id)sender;

@end
