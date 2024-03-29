//
//  DataManager.m
//  Algorithms
//
//  Created by Carl Wieland on 9/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "DataManager.h"
#import "Category.h"
#import "Algorithm.h"
#import "RelatedFile.h"

@implementation DataManager
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
-(id)init{
    self=[super init];
    if(self){
        NSError *e = nil;
        
        NSString *bundleRoot = [[NSBundle mainBundle] bundlePath];
        
        NSString* fullPath = [bundleRoot stringByAppendingPathComponent:@"Objects.json"];
        
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:fullPath] options: NSJSONReadingMutableContainers error: &e];
        NSLog(@"%@:%@",jsonDict,e);
        NSArray* categories = [jsonDict objectForKey:@"categories"];
        Category* algo = nil;
        Category* data = nil;
        Category* set = nil;
        for (NSDictionary* dict in categories) {
            Category* cat = [NSEntityDescription insertNewObjectForEntityForName:@"Category"
                                                          inManagedObjectContext:self.managedObjectContext];
            [cat setValuesForKeysWithDictionary:dict];
            if ([[cat name] isEqualToString:@"Algorithms"])
                algo = cat;
            else if ([[cat name] isEqualToString:@"Data Structures"])
                data = cat;
            else if ([[cat name] isEqualToString:@"Settings"])
                set = cat;
            
        }
        for (NSDictionary* dict in [jsonDict objectForKey:@"data"]) {
            Algorithm* newAlg = [NSEntityDescription insertNewObjectForEntityForName:@"Algorithm"
                                                              inManagedObjectContext:self.managedObjectContext];
            [newAlg setValuesForKeysWithDictionary:dict];
            [newAlg setCategory:data];
            [self setUpFilePathsFor:newAlg inDictionary:dict];
        }
        for (NSDictionary* dict in [jsonDict objectForKey:@"algorithms"]) {
            Algorithm* newAlg = [NSEntityDescription insertNewObjectForEntityForName:@"Algorithm"
                                                              inManagedObjectContext:self.managedObjectContext];
            [newAlg setValuesForKeysWithDictionary:dict];
            [newAlg setCategory:algo];
            [self setUpFilePathsFor:newAlg inDictionary:dict];            
        }
        for (NSDictionary* dict in [jsonDict objectForKey:@"settings"]) {
            Algorithm* newAlg = [NSEntityDescription insertNewObjectForEntityForName:@"Algorithm"
                                                              inManagedObjectContext:self.managedObjectContext];
            [newAlg setCategory:set];
            [newAlg setValuesForKeysWithDictionary:dict];

        }
        if(![[NSUserDefaults standardUserDefaults] objectForKey:@"codeStyle"]){
            NSMutableArray* codeStyles = [NSMutableArray new];
            for (NSString* val in [jsonDict objectForKey:@"codeStyles"]) {
                [codeStyles addObject:val];
            }
            [[NSUserDefaults standardUserDefaults] setObject:codeStyles forKey:@"codeStyles"];
            [[NSUserDefaults standardUserDefaults] setObject:[codeStyles objectAtIndex:0] forKey:@"codeStyle"];
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"showLineNums"];
        }
    }
    return self;
    
    
}
-(RelatedFile*)getOrCreateFileWithName:(NSString*)fileName{
    static NSString *bundleRoot = nil;
    if (bundleRoot == nil) {
        bundleRoot = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"code"];
    }
    
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"RelatedFile"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name = %@",fileName]];
    NSArray* files = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    if([files count]>0){
        return [files lastObject];
    }
    else{
        RelatedFile* file = [NSEntityDescription insertNewObjectForEntityForName:@"RelatedFile"
                                                          inManagedObjectContext:self.managedObjectContext];
        [file setName:fileName ];
        [file setFilePath:[bundleRoot stringByAppendingPathComponent:fileName]];
        return file;
    }
}

-(void)setUpFilePathsFor:(Algorithm*)algo inDictionary:(NSDictionary*)dict{
    for (NSString* fileName in [dict objectForKey:@"related"]) {
        [algo addRelatedFilesObject:[self getOrCreateFileWithName:[fileName stringByAppendingString:@".h"]]];
        [algo addRelatedFilesObject:[self getOrCreateFileWithName:[fileName stringByAppendingString:@".m"]]];        
    }
}
+(DataManager *)shared
{
    static DataManager *_sharedInstance;
    if(!_sharedInstance) {
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^{
            _sharedInstance = [[super allocWithZone:nil] init];
        });
    }
    
    return _sharedInstance;
}
+ (id)allocWithZone:(NSZone *)zone {
    return [self shared];
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}

+(void)save{
    [[DataManager shared] saveContext];
}

+(NSManagedObjectContext*)context{
    return [[DataManager shared] managedObjectContext];
}





#pragma mark - Core Data stack

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Algorithms" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Algorithms.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end
