//
//  CitiesSearchController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/7/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "CitiesSearchController.h"
#import "FindersSearchController.h"
#import "City.h"
#import "BackstepModel.h"

@interface CitiesSearchController ()

@end

@implementation CitiesSearchController

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
    [City get:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FindersSearchController *findersController = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    City *selectedCity = [self.cities objectAtIndex:indexPath.row];
    
    [findersController setTitle:selectedCity.name];
    findersController.selectedCity = selectedCity;
}

/**-- Table Implementation --**/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cities count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cityCell"];
    }
    
    JSONModel<Tabular> *selected = [self.cities objectAtIndex:indexPath.row];
    cell.textLabel.text = [selected rowTitle];
    cell.detailTextLabel.text = [selected rowSubtitle];
    cell.imageView.image = [selected rowPicture];
    
    return cell;
}

/**-- GettableController implementation --**/
- (void)afterGet:(id)json
{
    self.cities = [City arrayOfModelsFromDictionaries:json];
    [self.tableView reloadData];
}

@end
