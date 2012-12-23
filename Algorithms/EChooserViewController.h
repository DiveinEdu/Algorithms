//
//  EChooserViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 12/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EChooserDelegate
@required
-(void)didSelectValue:(NSNumber*)value;
@end
@interface EChooserViewController : UITableViewController
@property (nonatomic, strong)NSArray* eValues;
@property (nonatomic, strong)id<EChooserDelegate> delegate;
@end
