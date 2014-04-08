//
//  LocationSearchController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "FindersSearchController.h"
#import "BinSearchController.h"
#import "City.h"
#import "Institution.h"
#import "Tabular.h"

@interface FindersSearchController ()

@end

@implementation FindersSearchController

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
    [Institution get:self cityId:self.selectedCity.id];
    
    [self.filterSegment addTarget: self
                           action: @selector(filterTable)
                 forControlEvents: UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    BinSearchController *binsController = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    Institution *selected = [self.finders objectAtIndex:indexPath.row];
    [binsController setTitle:selected.name];
    binsController.binCreatorId = selected.id;
}

- (NSMutableArray *)filterFindersByCat:(NSMutableArray *)institutions cat:(NSString *)cat
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < [institutions count] ; i++) {
        Institution *current = [institutions objectAtIndex:i];
        if ([current.category isEqualToString:cat]) {
            [result addObject:current];
        }
    }
    
    return result;
}

/**-- Button Actions --**/
- (void)filterTable
{
    NSString *category;
    if ([self.filterSegment selectedSegmentIndex] == 0) {
        category = @"police";
    } else {
        category = @"school";
    }
    
    self.filtered = [self filterFindersByCat:self.finders cat:category];
    [self.tableView reloadData];
}


/**-- Table Implementation --**/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.filtered count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"locationCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"locationCell"];
    }
    
    JSONModel<Tabular> *selected = [self.filtered objectAtIndex:indexPath.row];
    cell.textLabel.text = [selected rowTitle];
    cell.imageView.image = [selected rowPicture];
    
    return cell;
}


/**-- GettableController implementation --**/
- (void)afterGet:(id)json
{
    self.finders = [Institution arrayOfModelsFromDictionaries:json];
    [self filterTable];
}


@end
