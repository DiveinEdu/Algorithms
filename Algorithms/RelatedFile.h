//
//  RelatedFile.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Algorithm;

@interface RelatedFile : NSManagedObject

@property (nonatomic, retain) NSString * fileData;
@property (nonatomic, retain) NSString * filePath;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *algorithm;
@end

@interface RelatedFile (CoreDataGeneratedAccessors)

- (void)addAlgorithmObject:(Algorithm *)value;
- (void)removeAlgorithmObject:(Algorithm *)value;
- (void)addAlgorithm:(NSSet *)values;
- (void)removeAlgorithm:(NSSet *)values;

@end
