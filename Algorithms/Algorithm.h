//
//  Algorithm.h
//  Algorithms
//
//  Created by Carl Wieland on 9/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Algorithm : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject *category;
@property (nonatomic, retain) NSManagedObject *relatedFiles;

@end
