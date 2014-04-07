//
//  BinSearchController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "BinSearchController.h"
#import "FoundSearchController.h"
#import "Bin.h"

@interface BinSearchController ()

@end

@implementation BinSearchController

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
    NSString *filterType;
    if (self.institutionBin) {
        filterType = @"institution";
    } else {
        filterType = @"city";
    }
    
    [Bin get:self filterType:filterType filterId:self.binCreatorId];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FoundSearchController *foundController = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    JSONModel<Tabular,BackstepModel> *selected = [self.bins objectAtIndex:indexPath.row];
    [foundController setTitle:[selected rowTitle]];
    
    foundController.binId = selected.id;    
}

/**-- Table Implementation --**/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.bins count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"binCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"binCell"];
    }
    
    JSONModel<Tabular> *selected = [self.bins objectAtIndex:indexPath.row];
    cell.textLabel.text = [selected rowTitle];
    cell.detailTextLabel.text = [selected rowSubtitle];
    cell.imageView.image = [selected rowPicture];
    
    return cell;
}

/**-- GettableController implementation --**/
- (void)afterGet:(id)json
{
    self.bins = [Bin arrayOfModelsFromDictionaries:json];
    [self.tableView reloadData];
}

@end
