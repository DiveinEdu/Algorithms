//
//  BSTView.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "BSTView.h"
#import <QuartzCore/QuartzCore.h>
#import "TreeNode.h"
#import "ArrowView.h"
#import <math.h>
@implementation BSTView
-(id)initWithNode:(TreeNode *)node{
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
    }
    return self;
}
-(void)addBSTView:(BSTView*)view{
    switch ([self.node compare:view.node]) {
        case NSOrderedDescending:
            if (self.right == nil){
                self.right = view;
                view.parent = self;
                [self addSubview:view];

                
            }
            else
                [self.right addBSTView:view];
            break;
        case NSOrderedAscending:
            if  (self.left==nil){
                self.left = view;
                view.parent = self;
                [self addSubview:view];
            }
            else
                [self.left addBSTView:view];
            break;
        case NSOrderedSame:
            break;
    }
    [self fixViews];
}
-(void)fixViews{
    //reset the arrows
    [self.rightArrow removeFromSuperview];
    [self.leftArrow removeFromSuperview];

    //calculate the space needed for both views.
    CGFloat width = (self.right != self.left) ? (self.right.frame.size.width+150+self.left.frame.size.width) : 50;
    CGFloat height = ( MAX(self.right.frame.size.height,self.left.frame.size.height) +100);
    CGSize size = CGSizeMake(width,height);
    
    self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y,size.width ,size.height);
    //update left side
    [self.left setFrame:CGRectMake(0, 100, self.left.frame.size.width, self.left.frame.size.height)];
    
    //update right side
    [self.right setFrame:CGRectMake(width - self.right.frame.size.width, 100, self.right.frame.size.width, self.right.frame.size.height)];
    
    [self.value setFrame:CGRectMake((size.width/2)-25, 0, 50, 50)];
    
    
    if (self.right) {
        if (![[self subviews] containsObject:self.right]) {
            [self addSubview: self.right];
        }
        //create the right arrow
        self.rightArrow = [[ArrowView alloc ]initWithStartPoint:CGPointMake(self.value.center.x, self.value.frame.size.height) andEndPoint:CGPointMake(self.right.center.x, self.right.frame.origin.y) ];
        [self addSubview:self.rightArrow];
    }
    
    if (self.left) {
        if (![[self subviews] containsObject:self.left]) {
            [self addSubview: self.left];
        }        self.leftArrow = [[ArrowView alloc ]initWithStartPoint:CGPointMake(self.value.center.x, self.value.frame.size.height) andEndPoint:CGPointMake(self.left.center.x, self.left.frame.origin.y) ];
        [self addSubview:self.leftArrow];
        
        
    }
}
-(BOOL)removeNode:(TreeNode *)node{
    BSTView* cur;
    switch ([node compare:self.node]) {
        case NSOrderedDescending:
            if (self.left != NULL){
                [self.left removeNode:node] ;
                [self fixViews];
            }
            else
                return NO;
        case NSOrderedAscending:
            if (self.right != NULL){
                [self.right removeNode:node ];
                [self fixViews];
                return true;
            }
            else
                return NO;
        case NSOrderedSame:
            //I am need to remove myself!
            for (UIView* view in [self subviews]) {
                [view removeFromSuperview];
            }
            [self removeFromSuperview];

            if (self.left != NULL && self.right != NULL) {
                //we find the lowest node on the right
                cur = self.right;
                while (cur.left!=nil) {
                    cur = cur.left;
                }
                if (cur.parent != self) {
                    //cut cur off and replace this node
                    cur.parent.left = cur.right;
                    [cur.parent fixViews];
                    for (UIView* view in [cur subviews]) {
                        [view removeFromSuperview];
                    }
                    [cur removeFromSuperview];
                    [cur setParent: self.parent];
                    [cur.parent addSubview:cur];

                    if (self == self.parent.left){
                        self.parent.left = cur;
                        
                    }
                    else{
                        self.parent.right = cur;
                    }
                    cur.left = self.left;
                    cur.right = self.right;
                    [cur addSubview:cur.right];
                    [cur addSubview:cur.left];
                }
                else{
                    //fix my parents view
                    if (self == self.parent.left){
                        self.parent.left = cur;
                        
                    }
                    else{
                        self.parent.right = cur;
                    }
                    //fix my views
                    cur.left = self.left;
                    [cur.parent fixViews];

                    [cur setParent:self.parent];
                }
                self.left = nil;
                self.right = nil;
                [cur setFrame:CGRectMake(cur.frame.origin.x, cur.frame.origin.y-100, cur.frame.size.width, cur.frame.size.height)];
                [cur addSubview:cur.value];
                [cur fixViews];

                
                
            } else if (self.parent.left == self) {
                self.parent.left = (self.left != NULL) ? self.left : self.right;
                [self.parent.left setParent:self.parent];
            } else if (self.parent.right == self) {
                self.parent.right = (self.left != NULL) ? self.left : self.right;
                [self.parent.right setParent:self.parent];
            }

            break;
        default:
            break;
    }

    return true;
}
@end
