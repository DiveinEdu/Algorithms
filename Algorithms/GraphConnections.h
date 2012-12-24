//
//  GraphConnections.h
//  Algorithms
//
//  Created by Carl Wieland on 12/23/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphConnections : NSObject

-(NSInteger)count;
-(BOOL)containsObject:(NSObject*)obj;
-(void)removeObject:(NSObject*)obj;
-(void)addObject:(NSObject*)obj;
-(void)unionWith:(GraphConnections*)connections;
-(NSSet*)nodes;
-(NSMutableSet*)edges;

@end
