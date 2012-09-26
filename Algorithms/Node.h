//
//  Node.h
//  
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
-(id)initWithValue:(id)value;
-(id)getValue;
- (NSComparisonResult)compare:(Node *)otherObject;
@end
