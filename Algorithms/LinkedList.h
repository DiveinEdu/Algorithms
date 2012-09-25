//
//  LinkedList.h
//  Algorithms
//
//  Created by Carl Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;


@interface LinkedList : NSObject{
    int size;
}

@property (nonatomic, strong) Node* head;
-(void)addValueToFront:(id)value;
-(void)addValueToBack:(id)value;
-(void)removeFront;
-(void)traverse;
-(int)size;

@end
