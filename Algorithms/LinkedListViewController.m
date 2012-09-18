//
//  LinkedListViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "LinkedListViewController.h"
#import "LinkedList.h"
@interface LinkedListViewController ()
@property (nonatomic, strong) LinkedList* linkedList;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@end

@implementation LinkedListViewController
@synthesize detailView;
@synthesize insertValueField;

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
    self.linkedList = [LinkedList new];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setInsertValueField:nil];
    [self setDetailView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)addValue:(id)sender {
    [self.linkedList addValue:[[self.insertValueField text] integerValue]];
    [self.linkedList traverse];
}

- (IBAction)removeFront:(id)sender {
    [self.linkedList removeFront];
    [self.linkedList traverse];

    
}
#pragma mark - Split view

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


@end
