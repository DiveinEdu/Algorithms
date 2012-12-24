//
//  GraphPopoverController.h
//  Algorithms
//
//  Created by Carl Wieland on 12/5/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GraphNode;
@protocol GraphPopoverDelegate <NSObject>
@required
-(void)finishedEditingValue;
@end

@interface GraphPopoverController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (nonatomic, weak) GraphNode* node;
@property (nonatomic, weak) id<GraphPopoverDelegate> delegate;
- (IBAction)valueChanged:(id)sender;
- (IBAction)saveValue:(id)sender;

@end
