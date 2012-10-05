//
//  AVLNode.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 10/3/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TreeNode.h"

@interface AVLNode : TreeNode
@property (nonatomic) NSInteger height;
@property (nonatomic) NSInteger factor;
-(id)initWithValue:(id)value andHeight:(NSInteger)height;
-(NSInteger)balance;
@end
