//
//  HuffmanView.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HuffmanView.h"
#import <QuartzCore/QuartzCore.h>
#import "HuffmanNode.h"
@implementation HuffmanView
-(id)initWithNode:(HuffmanNode *)node{
    self = [super initWithFrame:CGRectMake(0, 0, 150, 150)];
    if(self){
        self.node = node;
        self.value = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width/2)-25, 0, 50, 50)];
        [self.value.layer setBorderWidth:3];
        [self.value.layer setBorderColor:[UIColor blackColor].CGColor];
        [self.value.layer setCornerRadius:25];
        [self.value setAdjustsFontSizeToFitWidth:YES];
        [self.value setAdjustsLetterSpacingToFitWidth:YES];
        [self.value setTextAlignment:NSTextAlignmentCenter];
        if(node.left && node.right)
            [self.value setText:[NSString stringWithFormat:@"%.2f",[node weight]]];
        else
            [self.value setText:[NSString stringWithFormat:@"%@",[node character]]];
        [self addSubview:self.value];
        [self fixViews];
    }
    return self;

}
-(void)fixLeft{
    if (self.node.left) {
        self.left = [[HuffmanView alloc] initWithNode:(HuffmanNode*)self.node.left];
        [self addSubview:self.left];
    }
}
-(void)fixRight{
    if (self.node.right) {
        self.right = [[HuffmanView alloc] initWithNode:(HuffmanNode*)self.node.right];
        [self addSubview:self.right];
    }
}
@end
