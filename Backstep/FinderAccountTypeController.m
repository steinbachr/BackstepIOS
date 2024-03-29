//
//  FinderAccountTypeController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "FinderAccountTypeController.h"
#import "FinderAccountBasicInfoController.h"
#import "FinderHomeController.h"
#import "PlistOperations.h"
#import "Institution.h"

@interface FinderAccountTypeController ()

@end

@implementation FinderAccountTypeController

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
    self.finder = [[FinderProfile alloc] init];
    
    NSDictionary *plist = [PlistOperations openPlist];
    if ([plist objectForKey:@"finder_id"]) {
        FinderHomeController *finderHome = [self.storyboard instantiateViewControllerWithIdentifier:@"finderProfileHome"];
        [self.navigationController presentViewController:finderHome animated:NO completion:nil];
    }

    self.finder.institution_category = [[[Institution institutionCategories] allKeys] objectAtIndex:0];
    self.typesDictionary = [Institution institutionCategories];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Overrides of UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return [[self.typesDictionary allKeys] count];
}

// Overrides of UIPickerViewDelegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [[self.typesDictionary allValues] objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    NSString *selectedCategory = [[self.typesDictionary allKeys] objectAtIndex:row];
    self.finder.institution_category = selectedCategory;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FinderAccountBasicInfoController *dest = [segue destinationViewController];
    dest.finder = self.finder;
}

@end
