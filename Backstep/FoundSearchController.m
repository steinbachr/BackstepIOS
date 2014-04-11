//
//  FoundSearchController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "FoundSearchController.h"
#import "FoundItem.h"
#import "SourcingAttempt.h"
#import "Tabular.h"
#import "MakeClaimCell.h"
#import "PlistOperations.h"

@interface FoundSearchController ()

@end

@implementation FoundSearchController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// check if foundItemId is in the list of attempts on found items this user has made
- (BOOL)itemPendingAttempt:(NSString *)foundItemId
{
    NSString *foundItemIds = [PlistOperations getFoundItemAttempts];
    NSArray *foundItemIdsArr = [foundItemIds componentsSeparatedByString:@","];

    return [foundItemIdsArr containsObject:foundItemId];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [FoundItem get:self binId:self.binId];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**-- Button Actions --**/
-(void)makeClaim:(UIButton *)sender
{
    int index = sender.tag;
    self.currentAttemptIndex = index;
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
    MakeClaimCell *cell = (MakeClaimCell *)[self.tableView cellForRowAtIndexPath:path];

    FoundItem *selected = [self.items objectAtIndex:index];
    SourcingAttempt* newAttempt = [[SourcingAttempt alloc] init];
    
    newAttempt.found_item = selected;
    newAttempt.lost_item = [PlistOperations getLostItem];
    [newAttempt create:cell.indicator controller:self];
}

/**-- Table Implementation --**/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MakeClaimCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foundSearchCell"];
    
    FoundItem *selected = [self.items objectAtIndex:indexPath.row];
    cell.itemDescription.text = [selected description];
    cell.itemChars.text = selected.identifying_characteristics;
    cell.itemImage.image = [selected rowPicture];
    
    // if the item has a pending claim request by this user, don't show the claim button
    if ([self itemPendingAttempt:selected.id]) {
        [cell.claimButton removeFromSuperview];
        cell.claimSubmittedLabel.hidden = NO;
    } else {
        cell.claimButton.tag = indexPath.row;
        [cell.claimButton addTarget:self action:@selector(makeClaim:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

/**-- GettableController implementation --**/
- (void)afterGet:(id)json
{
    self.items = [FoundItem arrayOfModelsFromDictionaries:json];
    [self.tableView reloadData];
}

/**-- CreatableController implementation --**/
- (void)afterCreate
{
    // remove the item that just had a sourcing attempt created from the list of found items and redraw the table
    [self.items removeObjectAtIndex:self.currentAttemptIndex];
    [self.tableView reloadData];
}

@end
