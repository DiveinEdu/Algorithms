//
//  HashTable.m
//  Algorithms
//
//  Created by Carl Wieland on 12/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HashTable.h"
#import "HashEntry.h"
#define DEFAULT_TABLE_SIZE 128
@interface HashTable()
@property (nonatomic, strong) NSMutableArray* table;
@property (nonatomic)NSInteger tableSize;
@end
@implementation HashTable
-(id)init{
    return [self initWithSize:DEFAULT_TABLE_SIZE];
}
-(id)initWithSize:(NSInteger)tableSize{
    self = [super init];
    if(self){
        self.tableSize = tableSize;
        self.table = [[NSMutableArray alloc]initWithCapacity:tableSize];
        for(int i = 0; i <tableSize;i++)
            [self.table addObject:[NSNull null]];
    }
    return self;
}

-(void)putObject:(NSObject*)obj forKey:(NSObject*)key{
    NSParameterAssert(obj!=nil);
    NSParameterAssert(key!=nil);
    NSInteger hash = [key hash]%self.tableSize;
    while ([self.table[hash] class] != [NSNull class] && [(HashEntry*)self.table[hash] key] != key)
        hash = (hash + 1) % self.tableSize;
    self.table[hash] = [[HashEntry alloc] initWithKey:key andValue:obj];
}
-(NSObject*)objectForKey:(NSObject*)key{
    NSParameterAssert(key!=nil);

    NSInteger hash = [key hash]%self.tableSize;
    while ([self.table[hash] class] != [NSNull class] && [(HashEntry*)self.table[hash] key] != key)
        hash = (hash + 1) % self.tableSize;
    if (self.table[hash] == nil)
        return nil;
    else
        return [(HashEntry*)self.table[hash] value];
}
-(BOOL)containsKey:(NSObject*)key{
    for (HashEntry* entry in self.table) {
        if ([[entry key] isEqual:key]) {
            return YES;
        }
    }
    return NO;
    
}
-(BOOL)containsValue:(NSObject*)value{
    for (HashEntry* entry in self.table) {
        if ([[entry value] isEqual:value]) {
            return YES;
        }
    }
    return NO;
}
-(NSObject*)getKey:(NSObject*)value{
    for (HashEntry* entry in self.table) {
        if ([[entry value] isEqual:value]) {
            return [entry key];
        }
    }
    return nil;
}
@end
