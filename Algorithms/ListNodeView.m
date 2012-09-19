//
//  ListNodeView.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "ListNodeView.h"
#import "Node.h"
#define kListNodeWidth  100
#define kMoveDistance   150
@implementation ListNodeView

-(id)initWithNode:(Node *)node{
    self = [super initWithFrame:CGRectMake(0, 0, kListNodeWidth, 40)];
    if(self){
        self.node=node;
        UILabel* value = [[UILabel alloc] initWithFrame:CGRectMake(20,20 , 80, 20)];
        [value setText:[self.node description]];
        [self addSubview:value];
    }
    return self;
}
-(void)moveRight{
    [UIView beginAnimations:@"MoveRight" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.15f];
    self.frame = CGRectMake(self.frame.origin.x+kMoveDistance, self.frame.origin.y,self.frame.size.width , self.frame.size.height);
    [UIView commitAnimations];
}
-(void)moveLeft{
    [UIView beginAnimations:@"MoveRight" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.15f];
    self.frame = CGRectMake(self.frame.origin.x-kMoveDistance, self.frame.origin.y,self.frame.size.width , self.frame.size.height);
    [UIView commitAnimations];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
