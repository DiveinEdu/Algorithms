//
//  QuicksortViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "QuicksortViewController.h"
#import "QuicksortSub.h"
@implementation QuicksortViewController
-(void)refresh{
    [self.tableView reloadData];
    [self.stepLabel setText:[NSString stringWithFormat:@"%i of %i",steps, [self.lists count]]];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:steps-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}

-(void)checkEmpty{
    if ([self.countField text].length == 0) {
        [self.countField setText:@"64"];
    }
    if ([self.minField text].length == 0) {
        [self.minField setText:@"0"];
    }
    if ([self.maxField text].length == 0) {
        [self.maxField setText:@"100"];
    }
}
- (IBAction)generate:(id)sender {
    [self checkEmpty];
    if([[self.countField text] integerValue]>64 ||[[self.countField text] integerValue]<0 )
        [ self.countField setText:@"64"];
    NSMutableArray* values = [[NSMutableArray alloc] initWithCapacity:[[self.countField text] integerValue]];

    NSInteger diff = [[self.maxField text] integerValue] - [[self.minField text] integerValue];
    for (int i =0; i < [[self.countField text] integerValue]; i++){
        NSInteger rand = arc4random()%diff;
        [values addObject:[NSNumber numberWithInt:[[self.maxField text] integerValue]-rand]];
    }
    steps = 0;
    self.lists = [QuicksortSub quickSort:values];

    for(int i =1; i<[values count]; i++){
        NSAssert([[values objectAtIndex:i-1] integerValue] <= [[values objectAtIndex:i] integerValue], @"Not sorted!");
    }
    [self.stepLabel setText:[NSString stringWithFormat:@"%i of %i",steps, [self.lists count]]];
    //[self.tableView reloadData];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"quickCell"];
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@",[self.lists objectAtIndex:[indexPath row]]]];
    [[cell textLabel] setAdjustsFontSizeToFitWidth:YES];
    [[cell textLabel] setAdjustsLetterSpacingToFitWidth:YES];
    return cell;
}
@end
