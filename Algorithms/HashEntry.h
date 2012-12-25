//
//  HashEntry.h
//  Algorithms
//
//  Created by Carl Wieland on 12/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashEntry : NSObject
-(id)initWithKey:(NSObject*)key andValue:(NSObject*)value;
-(NSObject*)key;
-(NSObject*)value;
@end
