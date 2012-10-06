//
//  Node.m
//  
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//
//

#import "Node.h"
@interface Node()
@property (nonatomic, strong) id value;
@end


@implementation Node
-(id)initWithValue:(id)value{
    self = [super init];
    if(self !=nil){
        self.value = value;
    }
    return self;
}
-(id)getValue{
    return self.value;
}
-(NSString*)description{
    return [NSString stringWithFormat:@"%@",self.value];
}

- (NSComparisonResult)compare:(Node *)otherObject {

    if ([[self getValue] integerValue] > [[otherObject getValue] integerValue]) {
        //self is greater than other object 9 > 1, order is descending
        return NSOrderedDescending;
    }
    else if ([[self getValue] integerValue] < [[otherObject getValue] integerValue]) {
        //self is less than other object, 3 < 9 order is ascending
        return NSOrderedAscending;
    }
    else {
        return NSOrderedSame;
    }
}

@end
