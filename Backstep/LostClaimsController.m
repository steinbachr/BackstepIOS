//
//  LostClaimsController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/8/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "LostClaimsController.h"
#import "SuccessfulClaimController.h"
#import "PlistOperations.h"

@interface LostClaimsController ()

@end

@implementation LostClaimsController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [SourcingAttempt get:self lostId:[PlistOperations getLostItemId]];
    [self.tableView setContentInset:UIEdgeInsetsMake(50,0,0,0)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.attempts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lostItemClaimCell"];
    
    SourcingAttempt *selected = [self.attempts objectAtIndex:indexPath.row];
    cell.textLabel.text = [selected.found_item description];
    cell.detailTextLabel.text = selected.found_item.identifying_characteristics;
    cell.imageView.image = [selected.found_item rowPicture];
    
    return cell;
}


/**-- GettableController implementation --**/
// check if any of self.attempts is a successful attempt. If so, return it. If not, return nil
- (SourcingAttempt *)successfulAttempt
{
    for (int i = 0 ;  i < [self.attempts count] ; i++) {
        SourcingAttempt *curAttempt = [self.attempts objectAtIndex:i];
        if (curAttempt.success) {
            return curAttempt;
        }
    }
    
    return nil;
}

- (void)afterGet:(id)json
{
    self.attempts = [SourcingAttempt arrayOfModelsFromDictionaries:json];
    
    /* if any of the attempts were a success, then present the successful claim controller modal */
    SourcingAttempt *successfulAttempt = [self successfulAttempt];
    if (successfulAttempt) {
        SuccessfulClaimController *successController = [self.storyboard instantiateViewControllerWithIdentifier:@"successfulClaimController"];
        successController.successfulAttempt = successfulAttempt;
        [self presentViewController:successController animated:NO completion:nil];
    } else {
        [self.tableView reloadData];
    }
}



@end
