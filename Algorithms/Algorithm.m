//
//  Algorithm.m
//  Algorithms
//
//  Created by Carl Wieland on 9/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Algorithm.h"


@implementation Algorithm

@dynamic name;
@dynamic category;
@dynamic relatedFiles;


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"trying to set value for key: %@",key);
}
-(id)valueForUndefinedKey:(NSString *)key{
    return nil;
}
@end
