//
//  HuffmanWeightController.m
//  Algorithms
//
//  Created by Carl & Hannah Wieland on 11/26/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "HuffmanWeightController.h"
#import "WeightCell.h"
@interface HuffmanWeightController ()

@end

@implementation HuffmanWeightController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    self.weights = [NSMutableArray new];
    CGSize size = CGSizeMake(400, 400); // size of view in popover
    self.contentSizeForViewInPopover = size;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addWeight:(id)sender {
    NSMutableDictionary* newWeight = [NSMutableDictionary new];
    [newWeight setObject:@"" forKey:@"char"];
    [newWeight setObject:@0.0 forKey:@"weight"];
    [self.weights insertObject:newWeight atIndex:0];
    [self.tableView reloadData];
}
- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
- (IBAction)creatTree:(id)sender {
    NSMutableDictionary* vals = [NSMutableDictionary new];
    double runTotal=0;
    for (NSDictionary* dict in self.weights) {
        NSNumber* val = [dict objectForKey:@"weight"] ;
        runTotal +=[val doubleValue];
        [vals setObject:val forKey:[dict objectForKey:@"char"]];
    }
    if( abs((runTotal-.95)) >.5 ){
        UIAlertView* error = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"Weights don't add up to 1" delegate:self cancelButtonTitle:@"Normalize" otherButtonTitles:@"OK", nil];
        [error show];
    }
    else
        [self.delegate createTableWithDictionary:vals];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.weights count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 62.0;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete ){
        [self.weights removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];

        
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeightCell* cell = [tableView dequeueReusableCellWithIdentifier:@"weightId"];
    if(cell == nil){
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"WeightCell" owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];

    }
    
    
    
    NSMutableDictionary* dict = self.weights[[indexPath row]];
    [cell.charField setText:[dict objectForKey:@"char"]];
    [cell.weightField setText:[[dict objectForKey:@"weight"] description]];
    [cell setDict:dict];
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    return cell;
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(buttonIndex ==0){
        NSMutableDictionary* vals = [NSMutableDictionary new];
        double runTotal=0;
        for (NSDictionary* dict in self.weights) {
            runTotal +=[[dict objectForKey:@"weight"] doubleValue];
        }
        for (NSDictionary* dict in self.weights) {
            NSNumber* val = [dict objectForKey:@"weight"] ;
            [vals setObject:[NSNumber numberWithDouble:[val doubleValue]/runTotal] forKey:[dict objectForKey:@"char"]];
        }
        [self.delegate createTableWithDictionary:vals];
    }
}
@end
