//
//  Weight.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/26/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "WeightCell.h"

@implementation WeightCell
-(void)awakeFromNib{
    [self.charField addTarget:self
                       action:@selector(textChanged:)
             forControlEvents:UIControlEventEditingChanged];
    [self.weightField addTarget:self
                       action:@selector(weightChanged:)
             forControlEvents:UIControlEventEditingChanged];
    
}
-(void)textChanged:(id)sender;
{
    [self.dict setObject:[self.charField text] forKey:@"char"];
}
-(void)weightChanged:(id)sender{
    [self.dict setObject:[NSNumber numberWithDouble:[[self.weightField text] doubleValue]] forKey:@"weight"];
}
@end
