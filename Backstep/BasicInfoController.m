//
//  BasicInfoController.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "BasicInfoController.h"

@interface BasicInfoController ()

@end

@implementation BasicInfoController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.colorArray = @[@"white", @"gray", @"blue", @"green", @"red", @"yellow", @"orange", @"pink", @"purple", @"brown",  @"black"];
    self.typeArray = @[@"backpack", @"money", @"purse", @"wallet", @"computer", @"phone", @"clothes", @"other"];
    
    [self.color selectRow:5 inComponent:0 animated:NO];
    [self.type selectRow:3 inComponent:0 animated:NO];
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
    
}

@end
