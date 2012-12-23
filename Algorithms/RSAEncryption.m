//
//  RSAEncryption.m
//  Algorithms
//
//  Created by Carl Wieland on 12/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "RSAEncryption.h"
#import "math.h"
@implementation RSAEncryption
-(id)initWithP:(NSInteger)p andQ:(NSInteger)q{
    if((self=[super init])){
        self.p = p;
        self.q = q;
        self.n = self.p*self.q;
        self.phiN = (self.p-1)*(self.q-1);
    }
    return self;
    
}
-(NSString*)publicKey{
    return [NSString stringWithFormat:@"(n = %i, e = %i)",self.n,self.e];
}
-(NSString*)privateKey{
    return [NSString stringWithFormat:@"(n = %i, d = %i)",self.n,self.d];
}
-(NSArray*)generatePossibleE{
    //Choose an integer e such that 1 < e < φ(n) and greatest common divisor gcd(e, φ(n)) = 1; i.e., e and φ(n) are coprime.

    NSMutableArray* possibles = [NSMutableArray new];
    for(int i = 2; i <self.phiN; i++){
        if ([self gcdOf:i with:self.phiN]==1) {
            [possibles addObject:[NSNumber numberWithInt:i]];
        }
    }
    return possibles;
}
-(NSInteger)encrypt:(NSInteger)m{
    NSInteger result = 1;
    NSInteger exponent = self.e;
    while( exponent > 0){
        if (exponent % 2 == 1)
            result = (result * m) % self.n;
        exponent = exponent >> 1;
        m = (m * m) % self.n;
        
    }
    return result;
}
-(NSInteger)decrypt:(NSInteger)c{
    NSInteger result = 1;
    NSInteger exponent = self.d;
    while( exponent > 0){
        if (exponent % 2 == 1)
            result = (result * c) % self.n;
        exponent = exponent >> 1;
        c = (c * c) % self.n;
        
    }
    return result;
}
-(NSInteger)gcdOf:(int)a with:(NSInteger) b{
    int c;
    while ( a != 0 ) {
        c = a; a = b%a;  b = c;
    }
    return b;
}
/*
 Function exp-by-squaring(x,n)
    if n=1 then return x;
    else if n is even then return exp-by-squaring(x*x, n/2);
    else if n is odd then return x * exp-by-squaring(x*x, (n-1)/2)).

 */
-(NSInteger)expoBySquaring:(NSInteger)x to:(NSInteger)n{
    if(n ==1)
        return x;
    else if (n %2 == 0){
        return [self expoBySquaring:x*x to:n/2];
    }
    else if (n%2==1){
        return x*[self expoBySquaring:x*x to:(n-1)/2];
    }
    return -1;
}
-(void)setE:(NSInteger)e{
    _e = e;
    [self setD:[self modInverseOf:e mod:self.phiN]];
}
-(NSInteger)modInverseOf:(NSInteger)a mod:(NSInteger) m{
	a %= m;
	for(int x = 1; x < m; x++) {
		if((a*x) % m == 1) return x;
	}
    return -1;
}

+(BOOL)isPrime:(NSInteger)value{
    if (value <=1) {
        return NO;
    }
    for (int i = 2; i*i<=value; i++) {
        if (value%i==0) {
            return NO;
        }
    }
    return YES;

}
@end
