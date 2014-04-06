//
//  DetailsController.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "DetailsController.h"
#import "PaymentController.h"
#import "MyItemController.h"
#import "LostItem.h"

@interface DetailsController ()

@end

@implementation DetailsController

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
    
    [self.finishButton addTarget:self action:@selector(submitItem) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([self.characteristicsTextField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:InfoRequiredTitle
                                                        message:InfoRequiredMessage
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.lostItem.identifying_characteristics = self.characteristicsTextField.text;
    PaymentController *dest = [segue destinationViewController];
    dest.lostItem = self.lostItem;
}

- (void)submitItem
{
    self.lostItem.identifying_characteristics = self.characteristicsTextField.text;
    [self.lostItem create:nil controller:self];
}
/**-- Creatable Controller Implementations --**/
- (void)afterCreate
{
    MyItemController *myItemController = [self.storyboard instantiateViewControllerWithIdentifier:@"myItemController"];
    [self presentViewController:myItemController animated:NO completion:nil];
}

@end
