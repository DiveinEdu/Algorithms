//
//  WikiViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/17/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WikiViewController : UIViewController
@property (nonatomic, strong) NSURL* url;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)launchSafari:(id)sender;

@end
