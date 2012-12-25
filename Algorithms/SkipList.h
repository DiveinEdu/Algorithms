//
//  SkipList.h
//  Algorithms
//
//  Created by Carl Wieland on 12/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SkipNode;
@interface SkipList : NSObject

-(id)initWithMaxLevel:(NSInteger)maxLevel;

-(id)removeValue:(id)value;
-(BOOL)addValue:(id)value;
-(NSInteger)size;
-(BOOL)containsValue:(id)value;

@end
