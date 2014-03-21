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
#import "PlistOperations.h"
#import "MyItemController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *plistPath = [PlistOperations pListPath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath])
    {
        MyItemController *myItemController = [self.storyboard instantiateViewControllerWithIdentifier:@"myItemController"];
        [self presentViewController:myItemController animated:NO completion:nil];
    }
    
    // alloc space for a new lost item
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
