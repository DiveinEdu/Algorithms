//
//  GraphPopoverController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 12/5/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GraphNode;
@interface GraphPopoverController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (nonatomic, weak) GraphNode* node;
- (IBAction)valueChanged:(id)sender;

@end
