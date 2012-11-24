//
//  HuffmanViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HeapViewController.h"
@class HuffmanTree;
@class HuffmanView;
@interface HuffmanViewController : HeapViewController
@property (nonatomic, strong)HuffmanTree* tree;
@property (nonatomic, strong)HuffmanView* rootView;
- (IBAction)buildWithUS:(id)sender;
- (IBAction)buildWithCustom:(id)sender;
- (IBAction)buildWithString:(id)sender;
- (IBAction)encode:(id)sender;
- (IBAction)decode:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *stringBuilder;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@end
