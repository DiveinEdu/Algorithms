//
//  CodePopoverController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  Algorithm;

@interface CodePopoverController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, weak) Algorithm *algorithm;

-(id)initWithAlgorithm:(Algorithm*)algorithm;


@end
