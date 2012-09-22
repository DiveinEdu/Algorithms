//
//  CodeViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "CodeViewController.h"

@interface CodeViewController ()

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.codeView setText:[NSString stringWithContentsOfFile:self.fullPath encoding:NSUTF8StringEncoding error:nil]];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCodeView:nil];
    [super viewDidUnload];
}
@end
