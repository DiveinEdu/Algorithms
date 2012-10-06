//
//  Algorithm.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Category, RelatedFile;

@interface Algorithm : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * viewID;
@property (nonatomic, retain) Category *category;
@property (nonatomic, retain) NSSet *relatedFiles;
@end

@interface Algorithm (CoreDataGeneratedAccessors)

- (void)addRelatedFilesObject:(RelatedFile *)value;
- (void)removeRelatedFilesObject:(RelatedFile *)value;
- (void)addRelatedFiles:(NSSet *)values;
- (void)removeRelatedFiles:(NSSet *)values;

@end
