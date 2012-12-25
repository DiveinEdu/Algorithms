//
//  HashEntry.m
//  Algorithms
//
//  Created by Carl Wieland on 12/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HashEntry.h"
@interface HashEntry()
@property(nonatomic, strong)NSObject* value;
@property(nonatomic, strong)NSObject* key;
@end

@implementation HashEntry
-(id)initWithKey:(NSObject*)key andValue:(NSObject*)value{
    self = [super init];
    if(self){
        self.key = key;
        self.value = value;
    }
    return self;
}
@end
