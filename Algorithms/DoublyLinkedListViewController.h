//
//  DoublyLinkedListViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"
@class DoublyLinkedList;
@class DoublyLinkedListView;

@interface DoublyLinkedListViewController : DataViewController

@property (nonatomic, strong) DoublyLinkedList* doublyLinkedList;
@property (weak, nonatomic) IBOutlet DoublyLinkedListView *listView;
@property (weak, nonatomic) IBOutlet UITextField *inputField;

- (IBAction)addFront:(id)sender;
- (IBAction)addBack:(id)sender;

@end
