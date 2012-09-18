//
//  LinkedList.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;


@interface LinkedList : NSObject{
    int size;
}

@property ( nonatomic, strong) Node* head;
@property ( nonatomic, strong) Node* tail;

-(void)addValue:(int)value;
-(void)removeFront;
-(void)removeLast;
-(void)traverse;
-(int)getSize;
@end
