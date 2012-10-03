//
//  RedBlackView.m
//  Algorithms
//
//  Created by Carl Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "RedBlackView.h"
#import <QuartzCore/QuartzCore.h>
#import "RedBlackNode.h"

@implementation RedBlackView

-(id)initWithNode:(RedBlackNode *)node{
    self = [super initWithFrame:CGRectMake(0, 0, 150, 150)];
    if(self){
        self.node = node;
        self.value = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width/2)-25, 0, 50, 50)];
        [self.value setText:[self.node description]];
        [self.value.layer setBorderWidth:3];
        [self.value.layer setBorderColor:[UIColor blackColor].CGColor];
        [self.value setAdjustsFontSizeToFitWidth:YES];
        [self.value setAdjustsLetterSpacingToFitWidth:YES];
        [self.value setTextAlignment:NSTextAlignmentCenter];
        [self.value setText:[self.node description]];
        [self addSubview:self.value];
        [self fixViews];
    }
    return self;
}
-(void)fixViews{
    switch ([(RedBlackNode*)self.node color]) {
        case RED:
            [self.value.layer setBorderColor:[UIColor redColor].CGColor];
            break;
        case BLACK:
            [self.value.layer setBorderColor:[UIColor blackColor].CGColor];
            break;
        default:
            break;
    }
    [super fixViews];
}
@end
