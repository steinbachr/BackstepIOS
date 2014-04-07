//
//  MatchesController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "MatchesController.h"
#import "SourcingAttempt.h"
#import "FoundItem.h"
#import "LostItem.h"
#import "MatchTableViewCell.h"

@interface MatchesController ()

@end

@implementation MatchesController

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
    [SourcingAttempt get:self];
    [self.tableView setContentInset:UIEdgeInsetsMake(50,0,0,0)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


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
    MatchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"matchCell"];
    
    SourcingAttempt *selectedItem = [self.items objectAtIndex:indexPath.row];
    FoundItem *foundItem = selectedItem.found_item;
    LostItem *lostItem = selectedItem.lost_item;
    
    cell.foundItemDesc.text = [foundItem description];
    
    UIImage * picture = [foundItem pictureAsImage];
    if (picture) {
        cell.foundItemImg.image = picture;
    }
    
    // make all the images the same size
    CGSize itemSize = CGSizeMake(50, 40);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return cell;
}


/**-- GettableController implementation --**/
- (void)afterGet:(id)json
{
    self.items = [SourcingAttempt arrayOfModelsFromDictionaries:json];
    [self.tableView reloadData];
}

@end
