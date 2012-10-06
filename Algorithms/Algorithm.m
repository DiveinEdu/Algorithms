//
//  Algorithm.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "Algorithm.h"
#import "Category.h"
#import "RelatedFile.h"


@implementation Algorithm

@dynamic name;
@dynamic viewID;
@dynamic category;
@dynamic relatedFiles;
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
-(id)valueForUndefinedKey:(NSString *)key{
    return nil;
}
@end
