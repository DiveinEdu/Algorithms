//
//  HuffmanViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 11/19/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HuffmanViewController.h"
#import "HuffmanTree.h"
#import "HuffmanView.h"
@interface HuffmanViewController ()

@end

@implementation HuffmanViewController

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
    self.tree = [HuffmanTree new];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)refresh{
    [self.rootView removeFromSuperview];
    if ([self.tree root]) {
        self.rootView = [[HuffmanView alloc] initWithNode:(HeapNode*)[self.tree root]];
        [self.scrollView addSubview:self.rootView];
        
        [self.scrollView setContentSize:self.rootView.frame.size];
        self.scrollView.minimumZoomScale = self.scrollView.frame.size.width / self.rootView.frame.size.width;
        self.scrollView.maximumZoomScale = 2.0;
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale];
        
        
    }
    
    
}
- (IBAction)remove:(id)sender {
    
    [self refresh];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buildWithUS:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"USWeights" ofType:@"plist"];
    
    NSDictionary* values = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@",values);
    [self.tree buildTreeWithValues:values];
    [self refresh];
}

- (IBAction)buildWithCustom:(id)sender {
    HuffmanWeightController* weighController = [[HuffmanWeightController alloc] initWithNibName:@"HuffmanWeightController" bundle:nil];
    [weighController setDelegate:self];
    UIButton *button = (UIButton*)sender;
    popover = [[UIPopoverController alloc] initWithContentViewController:weighController];
    [popover presentPopoverFromRect:CGRectMake(button.frame.size.width / 2, button.frame.size.height, 1, 1) inView:button permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}
-(void)createTableWithDictionary:(NSDictionary *)weights{
        [self.tree buildTreeWithValues:weights];
        [self refresh];
}
- (IBAction)buildWithString:(id)sender {
    if([[self.stringBuilder text] length]>0){
        [self.tree buildTreeWithString:[self.stringBuilder text]];
        [self refresh];
    }
}

- (IBAction)encode:(id)sender {
    [self.outputLabel setText:[self.tree encodeString:[self.valueField text]]];
}

- (IBAction)decode:(id)sender {
    [self.outputLabel setText:[self.tree decodeString:[self.valueField text]]];
}
- (void)viewDidUnload {
    [self setOutputLabel:nil];
    [self setStringBuilder:nil];
    [super viewDidUnload];
}
@end
