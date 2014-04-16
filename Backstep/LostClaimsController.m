//
//  LostClaimsController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/8/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "LostClaimsController.h"
#import "SuccessfulClaimController.h"
#import "ClaimRequestTableCell.h"
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
    [self.syncButton addTarget:self action:@selector(sync) forControlEvents:UIControlEventTouchUpInside];
    
    [SourcingAttempt get:self lostId:[PlistOperations getLostItemId]];
    [self.tableView setContentInset:UIEdgeInsetsMake(30,0,0,0)];
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
    ClaimRequestTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lostItemClaimCell"];
    
    SourcingAttempt *selected = [self.attempts objectAtIndex:indexPath.row];
    cell.itemDescription.text = [selected.found_item description];
    cell.itemCharacteristics.text = selected.found_item.identifying_characteristics;
    cell.itemImage.image = [selected.found_item rowPicture];
    
    if ([selected isFailure]) {
        cell.requestDeniedLabel.hidden = NO;
    }
    
    return cell;
}

- (void)toggleSync
{
    if (self.syncButton.hidden) {
        self.syncButton.hidden = NO;
        self.indicator.hidden = YES;
    } else {
        self.syncButton.hidden = YES;
        self.indicator.hidden = NO;
    }
}


/**-- Button Actions --**/
- (void)sync
{
    [SourcingAttempt get:self lostId:[PlistOperations getLostItemId]];
    [self toggleSync];
}


/**-- GettableController implementation --**/
// check if any of self.attempts is a successful attempt. If so, return it. If not, return nil
- (SourcingAttempt *)successfulAttempt
{
    for (int i = 0 ;  i < [self.attempts count] ; i++) {
        SourcingAttempt *curAttempt = [self.attempts objectAtIndex:i];
        if ([curAttempt successAsBool]) {
            return curAttempt;
        }
    }
    
    return nil;
}

- (void)afterGet:(id)json
{
    self.attempts = [SourcingAttempt arrayOfModelsFromDictionaries:json];
    [self toggleSync];
    
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
