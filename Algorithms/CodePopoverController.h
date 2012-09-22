//
//  CodePopoverController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CodePopoverController : UITableViewController
@property (nonatomic, retain) NSMutableArray *files;
-(id)initWithFiles:(NSArray*)files;
@end
