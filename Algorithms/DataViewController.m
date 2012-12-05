//
//  DataViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 9/21/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"
#import "CodePopoverController.h"
#import "Algorithm.h"
#import "WikiViewController.h"

@interface DataViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation DataViewController

- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    if (self.algorithm) {
        UIBarButtonItem* codeButton = [[UIBarButtonItem alloc]initWithTitle:@"Code" style:UIBarButtonItemStylePlain target:self action:@selector(loadCode:)];
        [self.navigationItem setRightBarButtonItem:codeButton];
        [self.navigationItem setLeftBarButtonItem:nil];
        if ([self.algorithm wikiLink]) {
            UIBarButtonItem* wikiButton = [[UIBarButtonItem alloc]initWithTitle:@"Wiki" style:UIBarButtonItemStylePlain target:self action:@selector(showWiki:)];
            [self.navigationItem setLeftBarButtonItem:wikiButton];
        }
    }
    [self setTitle:self.algorithm.name];
    

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


-(IBAction)showWiki:(id)sender{
    if ([self.codePickerPopover isPopoverVisible]) {
        [self.codePickerPopover dismissPopoverAnimated:YES];

    }
    else{
        WikiViewController* wiki = [self.storyboard instantiateViewControllerWithIdentifier:@"wikiView"];
        [wiki setUrl:[self.algorithm wikiURL]];
        self.codePickerPopover  = [[UIPopoverController alloc]
                                  initWithContentViewController:wiki];
        
        [self.codePickerPopover  presentPopoverFromBarButtonItem:sender
                                       permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}



-(IBAction)loadCode:(id)sender{
    if ([self.codePickerPopover isPopoverVisible]) {
        [self.codePickerPopover dismissPopoverAnimated:YES];
        
    }
    else{
        UINavigationController* navCont =[self.storyboard instantiateViewControllerWithIdentifier:@"popNavController"];
        
        self.codePicker = [[navCont viewControllers] lastObject];
        [self.codePicker setAlgorithm:self.algorithm];;
        
        self.codePickerPopover = [[UIPopoverController alloc]
                                  initWithContentViewController:navCont];
        
        [self.codePickerPopover presentPopoverFromBarButtonItem:sender
                                       permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

    }
}



@end