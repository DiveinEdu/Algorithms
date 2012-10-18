//
//  Stack.h
//  Algorithms
//
//  Created by Carl Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ListNode;
@interface Stack : NSObject{
    int size;
}
-(void)addValue:(id)value;
-(void)push:(ListNode*)node;
-(ListNode*)pop;
-(ListNode*)peek;
-(int)size;
@end
