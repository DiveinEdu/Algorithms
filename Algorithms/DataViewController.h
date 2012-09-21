//
//  DataViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 9/21/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController<UISplitViewControllerDelegate>
@property (strong, nonatomic) id detailItem;
-(void)loadCode;


@end
