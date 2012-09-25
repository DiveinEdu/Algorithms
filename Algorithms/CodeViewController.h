//
//  CodeViewController.h
//  Algorithms
//
//  Created by Carl Wieland on 9/22/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RelatedFile;
@interface CodeViewController : UIViewController <UIWebViewDelegate>
@property ( nonatomic, weak) RelatedFile* file;
@property (weak, nonatomic) IBOutlet UIWebView *codeView;


@end
