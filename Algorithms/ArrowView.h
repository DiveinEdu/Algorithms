//
//  ArrowView.h
//  Algorithms
//
//  Created by Carl Wieland on 9/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    ARROW_TYPE_FILLED,
    ARROW_TYPE_EMPTY
}ARROW_TYPE;

@interface ArrowView : UIView
-(id)initWithStartPoint:(CGPoint)start andEndPoint:(CGPoint)end;
-(id)initWithFrame:(CGRect)frame andArrowType:(ARROW_TYPE)type;
@end
