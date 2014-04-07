//
//  FoundSearchController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "FoundSearchController.h"
#import "FoundItem.h"
#import "Tabular.h"

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foundSearchCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"foundSearchCell"];
    }
    
    JSONModel<Tabular> *selected = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = [selected rowTitle];
    cell.detailTextLabel.text = [selected rowSubtitle];
    cell.imageView.image = [selected rowPicture];
    
    return cell;
}

/**-- GettableController implementation --**/
- (void)afterGet:(id)json
{
    self.items = [FoundItem arrayOfModelsFromDictionaries:json];
    [self.tableView reloadData];
}

@end
