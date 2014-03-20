//
//  BasicInfoController.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "BasicInfoController.h"
#import "LocationController.h"

@interface BasicInfoController ()

@end

@implementation BasicInfoController

- (void)initializeSpinners
{
    NSInteger START_COLOR = 5;
    NSInteger START_TYPE = 3;
    
    [self.color selectRow:START_COLOR inComponent:0 animated:NO];
    [self.type selectRow:START_TYPE inComponent:0 animated:NO];
    
    self.lostItem.color = [self.colorArray objectAtIndex:START_COLOR];
    self.lostItem.type = [self.typeArray objectAtIndex:START_TYPE];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.colorArray = @[@"white", @"gray", @"blue", @"green", @"red", @"yellow", @"orange", @"pink", @"purple", @"brown",  @"black"];
    self.typeArray = @[@"backpack", @"money", @"purse", @"wallet", @"computer", @"phone", @"clothes", @"other"];
    
    [self initializeSpinners];
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
    if (pickerView == self.color) {
        return [self.colorArray count];
    } else {
        return [self.typeArray count];
    }
}

// Overrides of UIPickerViewDelegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    if (pickerView == self.color) {
        return [self.colorArray objectAtIndex:row];
    } else {
        return [self.typeArray objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    if (pickerView == self.color) {
        self.lostItem.color = [self.colorArray objectAtIndex:row];
    } else {
        self.lostItem.type = [self.typeArray objectAtIndex:row];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    LocationController *dest = [segue destinationViewController];
    dest.lostItem = self.lostItem;
}

@end
