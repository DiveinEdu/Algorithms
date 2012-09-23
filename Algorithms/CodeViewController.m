//
//  CodeViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "CodeViewController.h"

@interface CodeViewController ()
-(NSString*)htmlifyString:(NSString*)string;

@end

@implementation CodeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(NSString*)htmlifyString:(NSString*)string{
    NSString* toReturn = [string stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
    toReturn = [toReturn stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];
    
    return toReturn;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString* code = [NSString stringWithContentsOfFile:self.fullPath encoding:NSUTF8StringEncoding error:nil];
    
    NSString* htmlPage = [NSString stringWithFormat:@"<html>\
                                                      <link href=\"./js/sons-of-obsidian.css\" type=\"text/css\" rel=\"stylesheet\" />\
                                                      <script type=\"text/javascript\" src=\"./js/prettify.js\"></script>\
                                                      <body onload=\"prettyPrint()\">\
                                                      <pre class=\"prettyprint\">%@</pre>\
                                                      </body></html>",[self htmlifyString:code]];
    [self.codeView loadHTMLString:htmlPage  baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCodeView:nil];
    [self setCodeView:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.scrollView setContentSize:self.codeView.frame.size];
}
@end
