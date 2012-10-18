//
//  SettingsViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/13/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray* codeStyles;
@property (nonatomic, weak) UITableViewCell* currentDefault;
@end
