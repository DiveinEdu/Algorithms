//
//  MergeSortViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "MergeSortViewController.h"
#import "LinkedList.h"
#import "MergeSortSub.h"

@interface MergeSortViewController ()

@end

@implementation MergeSortViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)refresh{
    [self.tableView reloadData];
    [self.stepLabel setText:[NSString stringWithFormat:@"%i of %i",steps, [self.lists count]]];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:steps-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}

-(void)checkEmpty{
    if ([self.countField text].length == 0) {
        [self.countField setText:@"15"];
    }
    if ([self.minField text].length == 0) {
        [self.minField setText:@"0"];
    }
    if ([self.maxField text].length == 0) {
        [self.maxField setText:@"100"];
    }
}
- (IBAction)generateList:(id)sender {
    LinkedList* linkedList = [LinkedList new];
    [self checkEmpty];
    if([[self.countField text] integerValue]>15)
        [ self.countField setText:@"15"];
    for (int i =0; i < MIN([[self.countField text] integerValue],30); i++){
        NSInteger diff = [[self.maxField text] integerValue] - [[self.minField text] integerValue];
        NSInteger rand = arc4random()%diff;
        [linkedList addValueToFront:[NSNumber numberWithInt:[[self.maxField text] integerValue]-rand]];
    }
    steps = 1;
    
    self.lists = [NSMutableArray arrayWithObject:[linkedList description]];
    MergeSortSub* sub = [MergeSortSub new];
    [sub sortLinkedList:linkedList];
    [self.lists addObjectsFromArray:sub.steps];
    [self.stepLabel setText:[NSString stringWithFormat:@"%i of %i",steps, [self.lists count]]];
    [self.tableView reloadData];
}

- (IBAction)step:(id)sender {
    steps = MIN(++steps,[self.lists count]);
    [self refresh];
}




- (IBAction)showInfo:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"Info" message:@"Only steps with changes are shown" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return steps;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mergeCell"];
    [[cell textLabel] setText:[self.lists objectAtIndex:[indexPath row]]];
    [[cell textLabel] setAdjustsFontSizeToFitWidth:YES];
    [[cell textLabel] setAdjustsLetterSpacingToFitWidth:YES];
    return cell;
}
- (void)viewDidUnload {
    [self setCountField:nil];
    [self setMinField:nil];
    [self setMaxField:nil];
    [self setStepLabel:nil];
    [super viewDidUnload];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSMutableCharacterSet *_alnum = [NSMutableCharacterSet characterSetWithCharactersInString:@"-"];
    [_alnum formUnionWithCharacterSet:[NSCharacterSet alphanumericCharacterSet]];
    NSCharacterSet *nonNumberSet = [_alnum invertedSet];
    return ([string stringByTrimmingCharactersInSet:nonNumberSet].length > 0) || [string isEqualToString:@""];
}
@end
