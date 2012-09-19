//
//  LinkedListViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@class LinkedList;
@class LinkedListView;
@interface LinkedListViewController :UIViewController <UISplitViewControllerDelegate>
{
}
@property (weak, nonatomic) IBOutlet UITextField *insertValueField;
@property (weak, nonatomic) IBOutlet LinkedListView *detailView;
- (IBAction)addValue:(id)sender;
- (IBAction)removeFront:(id)sender;

@end
