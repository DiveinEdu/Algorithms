//
//  LinkedList.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/16/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "LinkedList.h"
#import "Node.h"
@implementation LinkedList
-(id)init{
    
    self = [super init];
    if(self!=nil){
        size=0;
    }
    
    return self;
}
-(void)addValue:(int)value{
    Node* newNode = [[Node alloc] initWithValue:value];
    
    if(self.head)
        [newNode setNext:self.head];

    self.head = newNode;
}
-(void)traverse{
    Node* n = self.head;
    NSMutableString* list = [NSMutableString string];
    while(n!=nil){
        [list appendFormat:@"%i,",[n getValue]];
        n = n.next;
    }
    NSLog(@"%@",list);
}
-(void)removeFront{
    if(self.head)
        self.head = [self.head next];
}
-(void)removeLast{
    
}
-(int)getSize{
    return size;
}
@end
