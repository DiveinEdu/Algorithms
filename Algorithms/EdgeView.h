//
//  EdgeView.h
//  Algorithms
//
//  Created by Carl Wieland on 12/24/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "ArrowView.h"

@interface EdgeView : ArrowView
@property (nonatomic, strong)UILabel* weightLabel;
-(id)initWithStartPoint:(CGPoint)start andEndPoint:(CGPoint)end withOffset:(NSInteger)offset andWeight:(NSInteger) weight;
@end
