//
//  SettingsViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 10/13/12.
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
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
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
- (IBAction)contactUs:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setToRecipients:@[@"balanceoni@gmail.com"]];
        [mailViewController setSubject:@"Algorithm Handbook Feedback"];
        [mailViewController setMessageBody:@"I love your cool app!" isHTML:NO];
        
        [self presentModalViewController:mailViewController animated:YES];
        
    }
    
    else {
        
        UIAlertView* alert =[[UIAlertView alloc] initWithTitle:@"Oops" message:@"Can't send emails currently" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }
}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    UIAlertView* alert=nil;
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail send canceled.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent.");
            alert =[[UIAlertView alloc] initWithTitle:@"Thanks!" message:@"Your message has been sent" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail send error: %@.", [error localizedDescription]);
            alert =[[UIAlertView alloc] initWithTitle:@"Oops" message:@"There was an error trying to send your message" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            break;
        default:
            break;
    }
    if (alert) {
        [alert show];
        
    }
    [self dismissModalViewControllerAnimated:YES];
}
@end
