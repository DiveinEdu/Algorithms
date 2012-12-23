//
//  RSAEncryption.h
//  Algorithms
//
//  Created by Carl Wieland on 12/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSAEncryption : NSObject
@property (nonatomic) NSInteger p,q,n,phiN,e,d;
-(id)initWithP:(NSInteger)p andQ:(NSInteger)q;
-(NSArray*)generatePossibleE;
-(NSString*)publicKey;
-(NSString*)privateKey;
-(NSInteger)encrypt:(NSInteger)m;
-(NSInteger)decrypt:(NSInteger)c;
-(NSInteger)expoBySquaring:(NSInteger)x to:(NSInteger)n;
+(BOOL)isPrime:(NSInteger)value;
@end
