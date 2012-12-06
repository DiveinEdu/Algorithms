//
//  GraphScrollView.h
//  Algorithms
//
//  Created by Carl Wieland on 10/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GraphScrollMenu
@required
-(void)addNewNode;

@end
@interface GraphScrollView : UIScrollView
@property (nonatomic, strong) id<GraphScrollMenu> graphDelegate;

-(void)addNewNode;
@end
