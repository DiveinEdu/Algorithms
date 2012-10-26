//
//  WikiViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 10/17/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "WikiViewController.h"

@interface WikiViewController ()

@end

@implementation WikiViewController

- (void)viewDidLoad
{
    [self.loadingView setBackgroundColor:[UIColor blackColor]];
    [self.loadingView setAlpha:.5];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}
- (IBAction)launchSafari:(id)sender {
        [[UIApplication sharedApplication] openURL:self.webView.request.URL];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.loadingView removeFromSuperview];
    
}
@end
