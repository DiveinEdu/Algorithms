//
//  TreeViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"
@class TreeView;
@interface TreeViewController : DataViewController <UIScrollViewDelegate>
@property (nonatomic, strong) TreeView* rootView;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
-(void)refresh;
@end
