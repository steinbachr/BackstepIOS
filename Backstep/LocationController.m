//
//  LocationController.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "LocationController.h"
#import "DetailsController.h"

@interface LocationController ()

@end

@implementation LocationController

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
    self.statesArray = @[@"Arkansas", @"Washington, D.C.", @"Delaware", @"Florida", @"Georgia", @"Kansas", @"Louisiana", @"Maryland", @"Missouri", @"Mississippi", @"North Carolina", @"Oklahoma", @"South Carolina", @"Tennessee", @"Texas", @"West Virginia", @"Alabama", @"Connecticut", @"Iowa", @"Illinois", @"Indiana", @"Maine", @"Michigan", @"Minnesota", @"Nebraska", @"New Hampshire", @"New Jersey", @"New York", @"Ohio", @"Rhode Island", @"Vermont", @"Wisconsin", @"California", @"Colorado", @"New Mexico", @"Nevada", @"Utah", @"Arizona", @"Idaho", @"Montana", @"North Dakota", @"Oregon", @"South Dakota", @"Washington", @"Wyoming", @"Hawaii", @"Alaska", @"Kentucky", @"Massachusetts", @"Pennsylvania", @"Virginia"];
    self.statesArray = [self.statesArray sortedArrayUsingSelector:@selector(compare:)];
    self.lostItem.state = [self.statesArray objectAtIndex:0];    
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
    return [self.statesArray count];
}

// Overrides of UIPickerViewDelegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [self.statesArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    self.lostItem.state = [self.statesArray objectAtIndex:row];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.lostItem.city = self.locationTextField.text;
    DetailsController *dest = [segue destinationViewController];
    dest.lostItem = self.lostItem;
}

@end
