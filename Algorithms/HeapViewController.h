//
//  HeapViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 9/29/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeViewController.h"
@class HeapView;
@class Heap;

@interface HeapViewController : TreeViewController <UIScrollViewDelegate,UIAlertViewDelegate>{
    UIAlertView* switchView;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *maxOrMin;
@property (nonatomic, strong) Heap* heap;
- (IBAction)addValue:(id)sender;
- (IBAction)testHeap:(id)sender;
- (IBAction)remove:(id)sender;
- (IBAction)switchTreeType:(id)sender;
@end
