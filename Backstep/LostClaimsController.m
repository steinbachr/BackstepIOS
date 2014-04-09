//
//  LostClaimsController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/8/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "LostClaimsController.h"
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
- (void)afterGet:(id)json
{
    self.attempts = [SourcingAttempt arrayOfModelsFromDictionaries:json];
    [self.tableView reloadData];
}



@end
