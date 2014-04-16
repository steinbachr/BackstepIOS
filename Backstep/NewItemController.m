//
//  NewItemController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "NewItemController.h"
#import "Constants.h"
#import "PlistOperations.h"
#import "FoundItemsController.h"

@interface NewItemController ()

@end

@implementation NewItemController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initializeSpinners
{
    NSInteger START_COLOR = 5;
    NSInteger START_TYPE = 3;
    
    [self.colorSpinner selectRow:START_COLOR inComponent:0 animated:NO];
    [self.categorySpinner selectRow:START_TYPE inComponent:0 animated:NO];
    
    self.foundItem.color = [[Constants colors] objectAtIndex:START_COLOR];
    self.foundItem.type = [[Constants categories] objectAtIndex:START_TYPE];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.submitButton addTarget:self action:@selector(createItem) forControlEvents:UIControlEventTouchUpInside];
    self.foundItem = [[FoundItem alloc] init];
    self.foundItem.finder = [PlistOperations getFinderId];
    
    [self initializeSpinners];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**-- Button Actions --**/
- (void) createItem
{
    if ([self.identifyingText performCheck]) {
        self.foundItem.identifying_characteristics = self.identifyingText.text;
        [self.foundItem create:self.indicator controller:self];
    }
}

/**-- Overrides of UIPickerViewDataSource --**/
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    if (pickerView == self.colorSpinner) {
        return [[Constants colors] count];
    } else {
        return [[Constants categories] count];
    }
}

/**-- Overrides of UIPickerViewDelegate --**/
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    if (pickerView == self.colorSpinner) {
        return [[Constants colors] objectAtIndex:row];
    } else {
        return [[Constants categories] objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    if (pickerView == self.colorSpinner) {
        self.foundItem.color = [[Constants colors] objectAtIndex:row];
    } else {
        self.foundItem.type = [[Constants categories] objectAtIndex:row];
    }
}

/**-- Overrides of CreatableController --**/
- (void)afterCreate
{
    [self.tabBarController setSelectedIndex:1];
}

@end
