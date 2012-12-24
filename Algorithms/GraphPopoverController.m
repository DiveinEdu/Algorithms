//
//  GraphPopoverController.m
//  Algorithms
//
//  Created by Carl Wieland on 12/5/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "GraphPopoverController.h"
#import "GraphNode.h"

@interface GraphPopoverController ()

@end

@implementation GraphPopoverController

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
    self.contentSizeForViewInPopover = CGSizeMake(250, 75);

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [self.valueField becomeFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setValueField:nil];
    [super viewDidUnload];
}
- (IBAction)valueChanged:(id)sender {
    [self.node setNewValue:self.valueField.text];
}
@end
