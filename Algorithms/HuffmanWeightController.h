//
//  HuffmanWeightController.h
//  Algorithms
//
//  Created by Carl Wieland on 11/26/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//
@protocol HuffmanWeight <NSObject>
@required
-(void)createTableWithDictionary:(NSDictionary*)weights;
@end
#import <UIKit/UIKit.h>


@interface HuffmanWeightController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (nonatomic, strong) NSMutableArray* weights;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id<HuffmanWeight>delegate;

- (IBAction)creatTree:(id)sender;
- (IBAction)addWeight:(id)sender;

@end
