//
//  BubbleSortViewController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 9/25/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "BubbleSortViewController.h"
#import "BubbleSortSub.h"
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

    [BubbleSort sortLinkedList:linkedList];
}

- (IBAction)previous:(id)sender {
    steps = MAX(--steps, 0);
    [self.tableView reloadData];
    [self.stepLabel setText:[NSString stringWithFormat:@"%i of %i",steps, [self.lists count]]];

}

- (IBAction)nextStep:(id)sender {
    steps = MIN(++steps,[self.lists count]);
    [self.tableView reloadData];
    [self.stepLabel setText:[NSString stringWithFormat:@"%i of %i",steps, [self.lists count]]];


}

- (IBAction)generate:(id)sender {
    LinkedList* linkedList = [LinkedList new];
    for (int i =0; i < 10; i++){
        [linkedList addValueToFront:[NSNumber numberWithInt:arc4random()%100]];
    }
    steps = 1;

    self.lists = [NSMutableArray arrayWithObject:[linkedList description]];
    [self.lists addObjectsFromArray:[BubbleSortSub sortLinkedList:linkedList]];
    [self.stepLabel setText:[NSString stringWithFormat:@"%i of %i",steps, [self.lists count]]];
    [self.tableView reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return steps;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bubbleCell"];
    [[cell textLabel] setText:[self.lists objectAtIndex:[indexPath row]]];
    
    return cell;
}
- (void)viewDidUnload {
    [self setTableView:nil];
    [self setStepLabel:nil];
    [super viewDidUnload];
}
@end
