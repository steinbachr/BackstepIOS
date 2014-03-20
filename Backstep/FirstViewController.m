//
//  FirstViewController.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "FirstViewController.h"
#import "LostItem.h"
#import "BasicInfoController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lostItem = [[LostItem alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.lostItem.loser_name = self.nameTextField.text;
    self.lostItem.loser_email = self.emailTextField.text;
    
    BasicInfoController *dest = [segue destinationViewController];
    dest.lostItem = self.lostItem;
}

@end
