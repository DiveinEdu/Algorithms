//
//  Stack.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/18/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;
@interface Stack : NSObject{
    int size;
}
-(void)addValue:(id)value;
-(void)push:(Node*)node;
-(Node*)pop;
-(Node*)peek;

@end
