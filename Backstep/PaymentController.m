//
//  PaymentController.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "PaymentController.h"

@interface PaymentController ()

@end

@implementation PaymentController

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
    self.monthsArray = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
    self.yearsArray = @[@"2014", @"2015", @"2016"];
    
    [self.month selectRow:6 inComponent:0 animated:NO];
    [self.year selectRow:1 inComponent:0 animated:NO];
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
    if (pickerView == self.month) {
        return [self.monthsArray count];
    } else {
        return [self.yearsArray count];
    }
}

// Overrides of UIPickerViewDelegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    if (pickerView == self.month) {
        return [self.monthsArray objectAtIndex:row];
    } else {
        return [self.yearsArray objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    
}

@end
