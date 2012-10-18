//
//  Algorithm.m
//  Algorithms
//
//  Created by Carl Wieland on 10/17/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Algorithm.h"
#import "Category.h"
#import "RelatedFile.h"


@implementation Algorithm

@dynamic name;
@dynamic viewID;
@dynamic enabled;
@dynamic wikiLink;
@dynamic category;
@dynamic relatedFiles;

-(NSURL*)wikiURL{
    NSURL* url = [NSURL URLWithString:[self.wikiLink stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    return url;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
-(id)valueForUndefinedKey:(NSString *)key{
    return nil;
}
@end
