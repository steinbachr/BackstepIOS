//
//  LocationSearchController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "LocationSearchController.h"
#import "City.h"
#import "Institution.h"
#import "Tabular.h"

@interface LocationSearchController ()

@end

@implementation LocationSearchController

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
    [Institution get:self];
    
    [self.filterSegment addTarget: self
                           action: @selector(filterTable)
                 forControlEvents: UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**-- Button Actions --**/
- (void)filterTable
{
    // 0 == cities
    // 1 == schools
    if ([self.filterSegment selectedSegmentIndex] == 0) {
        self.currentItems = self.cities;
    } else {
        self.currentItems = self.institutions;
    }

    [self.tableView reloadData];
}


/**-- Table Implementation --**/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.currentItems count];
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
    
    JSONModel<Tabular> *selected = [self.currentItems objectAtIndex:indexPath.row];
    cell.textLabel.text = [selected rowTitle];
    cell.imageView.image = [selected.class rowPicture];
    
    return cell;
}


/**-- GettableController implementation --**/
- (void)afterGet:(id)json
{
    if ([json count] > 0) {
        NSDictionary *sample = [json objectAtIndex:0];
        // check if sample has a value unique to institution, if not then it was a city call
        if ([sample objectForKey:@"phone_preferred"]) {
            self.institutions = [Institution arrayOfModelsFromDictionaries:json];
        } else {
            self.cities = [City arrayOfModelsFromDictionaries:json];
        }
        self.currentItems = self.cities;
        [self.tableView reloadData];
    } else {
        //handle error, we should never have NO institutions or cities
    }
}


@end
