//
//  EdgeView.m
//  Algorithms
//
//  Created by Carl Wieland on 12/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "EdgeView.h"

@implementation EdgeView

-(id)initWithStartPoint:(CGPoint)start andEndPoint:(CGPoint)end withOffset:(NSInteger)offset andWeight:(NSInteger) weight{
    self = [super initWithStartPoint:start andEndPoint:end withOffset:offset];
    if(self){
        self.weightLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-10, self.frame.size.height/2-10, 20, 20)];
        [self.weightLabel setFont:[UIFont systemFontOfSize:18]];
        [self.weightLabel setBackgroundColor:[UIColor clearColor]];
        if (weight == INT_MAX) {
            [self.weightLabel setText:@"\u221E"];

        } else {
            [self.weightLabel setText:[NSString stringWithFormat:@"%i",weight]];
        }
        [self.weightLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:self.weightLabel];
    }
    return self;
        
}



@end
