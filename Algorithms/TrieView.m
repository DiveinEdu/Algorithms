//
//  TrieView.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TrieView.h"
#import "TrieNode.h"
#import "ArrowView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TrieView

-(id)initWithNode:(TrieNode *)node{
    self = [super initWithFrame:CGRectMake(0, 0, 20, 20)];
    if (self) {
        self.childrenNodes = [NSMutableArray new];
        self.arrowViews = [NSMutableArray new];
        self.node = node;
        
        self.value = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width/2)-25, 0, 50, 50)];
        [self.value setText:[self.node description]];
        [self.value.layer setBorderWidth:3];
        [self.value.layer setBorderColor:[UIColor blackColor].CGColor];
        [self.value setAdjustsFontSizeToFitWidth:YES];
        [self.value setAdjustsLetterSpacingToFitWidth:YES];
        [self.value setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:self.value];
        [self fixViews];
    }
    return self;
}
-(void)fixViews{
    //clean everything up
    for (UIView* view in self.subviews) {
        if (![view isEqual:self.value]) {
            [view removeFromSuperview];
        }
    }
    CGFloat width = 0;
    CGFloat height = 100;
    for (TrieNode* node in self.node.children) {
        TrieView* view = [[TrieView alloc] initWithNode:node];
        [self addSubview:view];
        [view setFrame:CGRectMake(width+10, 100, view.frame.size.width, view.frame.size.height)];
        width += 50+view.frame.size.width;
        height = MAX(height, view.frame.size.height);
        [self.childrenNodes addObject:view];
    }
    if (width==0) {
        width = 50;
    }
    self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y,width ,height);
    [self.value setFrame:CGRectMake((width/2)-25, 0, 50, 50)];

    for (TrieView* view in self.childrenNodes) {
        ArrowView* arrow = [[ArrowView alloc ]initWithStartPoint:CGPointMake(self.value.center.x, self.value.frame.size.height) andEndPoint:CGPointMake(view.center.x, view.frame.origin.y) ];
        [self addSubview:arrow];
    }

}
@end
