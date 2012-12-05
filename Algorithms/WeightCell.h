//
//  Weight.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/26/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeightCell : UITableViewCell
@property (nonatomic, weak)NSMutableDictionary* dict;
@property (nonatomic, strong)IBOutlet UITextField* charField;
@property (nonatomic, strong)IBOutlet UITextField* weightField;


@end
