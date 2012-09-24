//
//  DataManager.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface DataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


+(NSManagedObjectContext*)context;
+(DataManager*)shared;
+(void)save;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end
