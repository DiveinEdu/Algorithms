//
//  RelatedFiles.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Algorithm;

@interface RelatedFiles : NSManagedObject

@property (nonatomic, retain) NSString * filePath;
@property (nonatomic, retain) Algorithm *algorithms;

@end
