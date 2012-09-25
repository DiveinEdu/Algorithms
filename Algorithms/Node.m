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
@end
