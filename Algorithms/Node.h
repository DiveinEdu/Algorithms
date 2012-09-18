//
//  Node.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject{
}
-(id)initWithValue:(int)value;
@property ( nonatomic, strong) Node* next;
@property ( nonatomic, weak) Node* previous;

-(int)getValue;
@end
