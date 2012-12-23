//
//  RSAViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 12/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "RSAViewController.h"
#import "RSAEncryption.h"
@interface RSAViewController ()

@end

@implementation RSAViewController

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

- (void)viewDidUnload {
    [self setPField:nil];
    [self setQField:nil];
    [self setNLabel:nil];
    [self setPhiN:nil];
    [self setELabel:nil];
    [self setChooseEButton:nil];
    [self setDLabel:nil];
    [self setPrivateKey:nil];
    [self setPublicKey:nil];
    [self setEncryptField:nil];
    [self setDecrpytField:nil];
    [self setEncryptedValue:nil];
    [self setDecryptedValue:nil];
    [super viewDidUnload];
}
- (IBAction)checkAndUse:(id)sender {

    p = [[self.pField text] integerValue];
    q = [[self.qField text] integerValue];
    
    if (![RSAEncryption isPrime:p]) {
        UIViewController* notPrime = [self.storyboard instantiateViewControllerWithIdentifier:@"notPrime"];
        [notPrime setContentSizeForViewInPopover:CGSizeMake(200, 50)];
        self.popover = [[UIPopoverController alloc] initWithContentViewController:notPrime];
        [self.popover presentPopoverFromRect:self.pField.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    else if(![RSAEncryption isPrime:q]){
        UIViewController* notPrime = [self.storyboard instantiateViewControllerWithIdentifier:@"notPrime"];
        [notPrime setContentSizeForViewInPopover:CGSizeMake(200, 50)];
        self.popover = [[UIPopoverController alloc] initWithContentViewController:notPrime];
        [self.popover presentPopoverFromRect:self.qField.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    else if(p == q){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"You're primes are the same!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else{
        encryptor =[[RSAEncryption alloc] initWithP:p andQ:q];
        [self.nLabel setText:[NSString stringWithFormat:@"(%i)(%i)=%i",p,q,encryptor.n]];
        [self.phiN setText:[NSString stringWithFormat:@"(%i-1)(%i-1)=(%i)(%i)=%i",p,q,p-1,q-1,encryptor.phiN]];
        [self.chooseEButton setEnabled:YES];
    }
}

- (IBAction)chooseEValue:(id)sender {
    NSArray* options = [encryptor generatePossibleE];
    EChooserViewController* chooser = [self.storyboard instantiateViewControllerWithIdentifier:@"eChooser"];
    [chooser setDelegate:self];
    [chooser setEValues:options];
    [chooser setContentSizeForViewInPopover:CGSizeMake(70, 400)];
    self.popover = [[UIPopoverController alloc] initWithContentViewController:chooser];
    [self.popover presentPopoverFromRect:self.chooseEButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (IBAction)encryptValue:(id)sender {
    NSInteger enc = [encryptor encrypt:[[self.encryptField text] integerValue]];
    [self.encryptedValue setText:[NSString stringWithFormat:@"%i",enc]];

}

- (IBAction)decryptValue:(id)sender {
    NSInteger dec = [encryptor decrypt:[[self.decrpytField text] integerValue]];
    [self.decryptedValue setText:[NSString stringWithFormat:@"%i",dec]];
}
-(void)didSelectValue:(NSNumber *)value{
    [encryptor setE:[value integerValue]];
    [self.eLabel setText:[NSString stringWithFormat:@"%i",[value integerValue]]];
    [self.dLabel setText:[NSString stringWithFormat:@"%i",encryptor.d]];
    
    [self.publicKey setText:[encryptor publicKey]];
    [self.privateKey setText:[encryptor privateKey]];
    [self.popover dismissPopoverAnimated:YES];
}
@end
