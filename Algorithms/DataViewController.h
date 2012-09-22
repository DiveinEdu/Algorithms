//
//  DataViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 9/21/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CodePopoverController;

@interface DataViewController : UIViewController<UISplitViewControllerDelegate>
@property (strong, nonatomic) id detailItem;
@property (nonatomic, retain) CodePopoverController *codePicker;
@property (nonatomic, retain) UIPopoverController *codePickerPopover;
-(IBAction)loadCode:(id)sender;


@end
