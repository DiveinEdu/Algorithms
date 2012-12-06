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

-(NSString*)htmlifyString:(NSString*)string{
    NSString* toReturn = [string stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
    toReturn = [toReturn stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];
    
    return toReturn;
}
-(NSString*)getDefaultCSS{
    NSString* def = [[[NSUserDefaults standardUserDefaults] objectForKey:@"codeStyle"] stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        return [[def lowercaseString] stringByAppendingString:@".css"];
    
}
-(NSString*)defaultLineNum{
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"showLineNums"]) {
        return @" linenums";
    }
    return @"";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (![self.file fileData]) {
        NSString* code = [NSString stringWithContentsOfFile:[self.file filePath] encoding:NSUTF8StringEncoding error:nil];
        [self.file setFileData:[self htmlifyString:code]];
    }    
    NSString* htmlPage = [NSString stringWithFormat:@"<html>\
                          <link href=\"./js/%@\" type=\"text/css\" rel=\"stylesheet\" />\
                          <script type=\"text/javascript\" src=\"./js/prettify.js\"></script>\
                          <body onload=\"prettyPrint()\">\
                          <pre class=\"prettyprint%@\">%@  </pre>\
                          </body></html>",[self getDefaultCSS],[self defaultLineNum],self.file.fileData];
    [self.codeView loadHTMLString:htmlPage  baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];

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
