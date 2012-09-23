//
//  CodeViewController.h
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CodeViewController : UIViewController <UIWebViewDelegate>
@property ( nonatomic, strong) NSString* fullPath;
@property (weak, nonatomic) IBOutlet UIWebView *codeView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
