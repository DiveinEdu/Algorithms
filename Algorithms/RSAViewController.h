//
//  RSAViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 12/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataViewController.h"
#import "EChooserViewController.h"
@class RSAEncryption;
@interface RSAViewController : DataViewController<EChooserDelegate>{
    NSInteger p,q;
    RSAEncryption* encryptor;
}
@property (weak, nonatomic) IBOutlet UITextField *pField;
@property (weak, nonatomic) IBOutlet UITextField *qField;
@property (weak, nonatomic) IBOutlet UILabel *nLabel;
@property (retain, nonatomic) UIPopoverController* popover;
@property (weak, nonatomic) IBOutlet UILabel *phiN;
@property (weak, nonatomic) IBOutlet UIButton *chooseEButton;
@property (weak, nonatomic) IBOutlet UILabel *dLabel;
@property (weak, nonatomic) IBOutlet UILabel *privateKey;
@property (weak, nonatomic) IBOutlet UILabel *publicKey;
@property (weak, nonatomic) IBOutlet UILabel *decryptedValue;
@property (weak, nonatomic) IBOutlet UITextField *encryptField;
@property (weak, nonatomic) IBOutlet UILabel *encryptedValue;
@property (weak, nonatomic) IBOutlet UITextField *decrpytField;
@property (weak, nonatomic) IBOutlet UILabel *eLabel;
- (IBAction)checkAndUse:(id)sender;
- (IBAction)chooseEValue:(id)sender;
- (IBAction)encryptValue:(id)sender;
- (IBAction)decryptValue:(id)sender;
@end
