//
//  HeapViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/29/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"
@class HeapView;
@class Heap;

@interface HeapViewController : DataViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (nonatomic, strong) HeapView* rootView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *maxOrMin;
@property (nonatomic, strong) Heap* heap;
- (IBAction)addValue:(id)sender;
- (IBAction)testHeap:(id)sender;
- (IBAction)remove:(id)sender;
@end
