//
//  SkipList.m
//  Algorithms
//
//  Created by Carl Wieland on 12/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "SkipList.h"
#import "SkipNode.h"
@interface SkipList()
@property (nonatomic, strong)SkipNode* head;
@end

@implementation SkipList
-(id)initWithMaxLevel:(NSInteger)maxLevel{
    self = [super init];
    if(self){

        
    }
    return self;
}

-(id)removeValue:(id)value{
    if ([self containsValue:value]) {
        NSLog(@"DO IT");
    }
    return nil;
}
-(BOOL)addValue:(id)value{
    
}
-(NSInteger)size{
    
}
-(BOOL)containsValue:(id)value{
    
}

@end
