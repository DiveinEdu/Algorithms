//
//  HashTable.h
//  Algorithms
//
//  Created by Carl Wieland on 12/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HashEntry.h"
@interface HashTable : NSObject
-(id)initWithSize:(NSInteger)tableSize;
-(void)putObject:(NSObject*)obj forKey:(NSObject*)key;
-(NSObject*)objectForKey:(NSObject*)key;
-(BOOL)containsKey:(NSObject*)key;
-(BOOL)containsValue:(NSObject*)value;
-(NSObject*)getKey:(NSObject*)value;
@end
