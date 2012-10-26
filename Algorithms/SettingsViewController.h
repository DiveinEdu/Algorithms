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
@property (weak, nonatomic) IBOutlet UISwitch *lineNumSwitch;
@property (nonatomic, weak) UITableViewCell* currentDefault;
- (IBAction)toggleShowLineNums:(id)sender;
- (IBAction)contactUs:(id)sender;
@end
