//
//  HeapViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 9/29/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HeapViewController.h"
#import "Heap.h"
#import "ArrayHeap.h"
#import "HeapView.h"

@interface HeapViewController ()

@end

@implementation HeapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self.scrollView setBackgroundColor:[UIColor cyanColor]];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testHeap:(id)sender {

    for (int i = 0; i<8; i++) {
        [self.valueField setText:[NSString stringWithFormat:@"%i",arc4random()%100]];
        [self addValue:self];
    }

}
- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setValueField:nil];
    [self setMaxOrMin:nil];
    [super viewDidUnload];
}
- (IBAction)addValue:(id)sender {
    if (self.heap ==nil) {
        HEAP_TYPE type = HEAP_MAX;
        if ([self.maxOrMin selectedSegmentIndex]!=0) {
            type = HEAP_MIN;
        }
        self.heap = [[Heap alloc] initWithType:type];
    }
    [self.heap addValue:[self.valueField text]];
    [self refresh];
    
}
-(void)refresh{
    [self.rootView removeFromSuperview];
    if ([self.heap root]) {
        self.rootView = [[HeapView alloc] initWithNode:[self.heap root]];
        [self.scrollView addSubview:self.rootView];
        
        [self.scrollView setContentSize:self.rootView.frame.size];
        self.scrollView.minimumZoomScale = self.scrollView.frame.size.width / self.rootView.frame.size.width;
        self.scrollView.maximumZoomScale = 2.0;
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale];
        

    }


}
- (IBAction)remove:(id)sender {
    /*TreeNode* node =*/ [self.heap getNext];
    [self refresh];
}

- (IBAction)switchTreeType:(id)sender {
    if ([self.heap root]!=nil) {
        switchView = [[UIAlertView alloc] initWithTitle:@"Are You Sure?" message:@"Switching types will erase current Heap" delegate:self cancelButtonTitle:@"Don't Switch" otherButtonTitles:@"Switch", nil];
        [switchView show ];
        
    }
    else{
        [self.rootView removeFromSuperview];
        HEAP_TYPE type = HEAP_MAX;
        if ([self.maxOrMin selectedSegmentIndex]!=0) {
            type = HEAP_MIN;
        }
        self.heap = [[Heap alloc] initWithType:type];
    }
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (alertView == switchView) {
        if (buttonIndex == 1) {
            [self.rootView removeFromSuperview];
            HEAP_TYPE type = HEAP_MAX;
            if ([self.maxOrMin selectedSegmentIndex]!=0) {
                type = HEAP_MIN;
            }
            self.heap = [[Heap alloc] initWithType:type];
        }
        else{
            [self.maxOrMin setSelectedSegmentIndex:([self.maxOrMin selectedSegmentIndex]+1)%2];
        }
    }
}
@end
