//
//  QuicksortViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"

@interface QuicksortViewController : DataViewController <UITableViewDelegate, UITableViewDataSource>{
    NSInteger steps;
}
@property(nonatomic, strong) NSArray* lists;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *countField;
@property (weak, nonatomic) IBOutlet UITextField *minField;
@property (weak, nonatomic) IBOutlet UITextField *maxField;
@property (weak, nonatomic) IBOutlet UILabel *stepLabel;
- (IBAction)generate:(id)sender;
- (IBAction)step:(id)sender;
- (IBAction)showInfo:(id)sender;
@end
