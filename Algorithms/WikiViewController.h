//
//  WikiViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 10/17/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WikiViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong)IBOutlet UIView* loadingView;
@property (nonatomic, strong) NSURL* url;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)launchSafari:(id)sender;

@end
