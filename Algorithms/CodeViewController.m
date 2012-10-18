//
//  CodeViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 9/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "CodeViewController.h"
#import "RelatedFile.h"
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
-(NSString*)getDefaultCSS{
    NSString* def = [[NSUserDefaults standardUserDefaults] objectForKey:@"codeStyle"];
    if ([def isEqualToString:@"Desert"] || [def isEqualToString:@"Sunburst"]) {
        return [[def lowercaseString] stringByAppendingString:@".css"];
    }
    else{
        return @"sons-of-obsidian.css";
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([self.file fileData]) {
        [self.codeView loadHTMLString:[self.file fileData]  baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];

    }
    else{
        NSString* code = [NSString stringWithContentsOfFile:[self.file filePath] encoding:NSUTF8StringEncoding error:nil];
        
        NSString* htmlPage = [NSString stringWithFormat:@"<html>\
                              <link href=\"./js/%@\" type=\"text/css\" rel=\"stylesheet\" />\
                              <script type=\"text/javascript\" src=\"./js/prettify.js\"></script>\
                              <body onload=\"prettyPrint()\">\
                              <pre class=\"prettyprint\">%@</pre>\
                              </body></html>",[self getDefaultCSS],[self htmlifyString:code]];
        [self.codeView loadHTMLString:htmlPage  baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
        [self.file setFileData:htmlPage];
    }
    

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

    [super viewDidUnload];
}

@end
