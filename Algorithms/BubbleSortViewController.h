//
//  BubbleSortViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"

@interface BubbleSortViewController : DataViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    NSInteger steps;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray* lists;
- (IBAction)previous:(id)sender;
- (IBAction)nextStep:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *countField;

@property (weak, nonatomic) IBOutlet UITextField *minField;
@property (weak, nonatomic) IBOutlet UITextField *maxField;
@property (weak, nonatomic) IBOutlet UILabel *stepLabel;
- (IBAction)generate:(id)sender;
- (IBAction)showInfo:(id)sender;
@end
