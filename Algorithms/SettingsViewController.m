//
//  SettingsViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/13/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"codeStyles"]);
    self.codeStyles = [[NSUserDefaults standardUserDefaults] objectForKey:@"codeStyles"];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [ self.codeStyles count];
}
-(void)resetDefault:(UITableViewCell*)newDefault{
    [self.currentDefault setAccessoryType:UITableViewCellAccessoryNone];
    [newDefault setAccessoryType:UITableViewCellAccessoryCheckmark];
    self.currentDefault = newDefault;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingsCell"];
    [cell.textLabel setText:[self.codeStyles objectAtIndex:[indexPath row]]];
    if ([[cell.textLabel text] isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"codeStyle"]]) {
        [self resetDefault:cell];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[NSUserDefaults standardUserDefaults] setObject:[self.codeStyles objectAtIndex:[indexPath row]] forKey:@"codeStyle"];
    [self resetDefault:[tableView cellForRowAtIndexPath:indexPath]];
    
    
}
@end
