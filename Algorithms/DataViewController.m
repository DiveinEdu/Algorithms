//
//  DataViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 9/21/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation DataViewController

- (void)viewDidLoad
{
    UIBarButtonItem* codeButton = [[UIBarButtonItem alloc]initWithTitle:@"Code" style:UIBarButtonItemStylePlain target:self action:@selector(loadCode)];
    [self.navigationItem setRightBarButtonItem:codeButton];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}


- (void)viewDidUnload {

    [super viewDidUnload];
}






-(void)loadCode{
    NSLog(@"%@",[[self class]description] );
    
}


@end
