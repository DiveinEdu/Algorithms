//
//  BubbleSortViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "BubbleSortViewController.h"
#import "BubbleSort.h"
#import "LinkedList.h"

@interface BubbleSortViewController ()

@end

@implementation BubbleSortViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)test:(id)sender{
    LinkedList* linkedList = [LinkedList new];
    for (int i =0; i < 10; i++){
        [linkedList addValueToFront:[NSNumber numberWithInt:arc4random()%100]];
    }
    BubbleSort* bsort = [BubbleSort new];
    [bsort sortLinkedList:linkedList];
}
@end
