//
//  MergeSortViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//


#import "DataViewController.h"

@interface MergeSortViewController : DataViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    NSInteger steps;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray* lists;
@property (weak, nonatomic) IBOutlet UITextField *countField;
@property (weak, nonatomic) IBOutlet UITextField *minField;
@property (weak, nonatomic) IBOutlet UITextField *maxField;
@property (weak, nonatomic) IBOutlet UILabel *stepLabel;
- (IBAction)generateList:(id)sender;
- (IBAction)step:(id)sender;
- (IBAction)showInfo:(id)sender;
@end
