//
//  SettingsViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 10/13/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface SettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate >
@property (nonatomic, strong) NSArray* codeStyles;
@property (nonatomic, weak) UITableViewCell* currentDefault;
- (IBAction)contactUs:(id)sender;
@end
