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

@interface DataViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation DataViewController

- (void)viewDidLoad
{
    UIBarButtonItem* codeButton = [[UIBarButtonItem alloc]initWithTitle:@"Code" style:UIBarButtonItemStylePlain target:self action:@selector(loadCode:)];
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






-(IBAction)loadCode:(id)sender{
    if(self.algorithm){
        UINavigationController* navCont =[self.storyboard instantiateViewControllerWithIdentifier:@"popNavController"];
        
        self.codePicker = [[navCont viewControllers] lastObject];
        [self.codePicker setAlgorithm:self.algorithm];;
        
        self.codePickerPopover = [[UIPopoverController alloc]
                                  initWithContentViewController:navCont];
        
        [self.codePickerPopover presentPopoverFromBarButtonItem:sender
                                       permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

    }
    
    /*NSString *bundleRoot = [[NSBundle mainBundle] bundlePath];
    bundleRoot =[bundleRoot stringByAppendingPathComponent:@"code"];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *dirContents = [fm contentsOfDirectoryAtPath:bundleRoot error:nil];
    NSMutableSet* files=[NSMutableSet set];
    for (NSString* file in dirContents) {
        [files addObject:[file stringByDeletingPathExtension]];
    }
    NSPredicate *fltr = [NSPredicate predicateWithFormat:@"%@ contains self ",[[self class] description]];
    [files filterUsingPredicate:fltr];
    
    UINavigationController* navCont =[self.storyboard instantiateViewControllerWithIdentifier:@"popNavController"];
    
    self.codePicker = [[navCont viewControllers] lastObject];
    [self.codePicker setFiles:[NSMutableArray arrayWithArray:dirContents]];
    
    self.codePickerPopover = [[UIPopoverController alloc]
                                initWithContentViewController:navCont];
    
    [self.codePickerPopover presentPopoverFromBarButtonItem:sender
                                permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];*/
}



@end