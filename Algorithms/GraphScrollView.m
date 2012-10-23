//
//  GraphScrollView.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "GraphScrollView.h"

@implementation GraphScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(BOOL)canBecomeFirstResponder{
    return TRUE;
}
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(addNewNode)) {
        return YES;
    }
    return NO;
}
-(void)addNewNode{
    [self.graphDelegate addNewNode];
}
@end
