//
//  SuccessfulClaimController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/8/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "SuccessfulClaimController.h"

@interface SuccessfulClaimController ()

@end

@implementation SuccessfulClaimController

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
    [self.successfulAttempt getFinder:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**-- GettableController implementation --**/
- (void)initLabelHelper:(UILabel *)label val:(NSString *)val
{
    label.hidden = NO;
    label.text = val;
}

- (void)afterGetInit
{
    self.finderImage.image = [self.successfulAttemptInst iconForCategory];
    [self initLabelHelper:self.finderName val:self.successfulAttemptInst.name];
    [self initLabelHelper:self.finderEmail val:self.successfulAttemptUser.email];
    [self initLabelHelper:self.finderPhone val:self.successfulAttemptInst.phone];
    [self initLabelHelper:self.finderCity val:self.successfulAttemptInst.city];
    [self initLabelHelper:self.finderState val:self.successfulAttemptInst.state];
    [self initLabelHelper:self.finderAddress val:self.successfulAttemptInst.address];
}

- (void)afterGet:(id)json
{
    NSError* err = nil;
    self.successfulAttemptInst = [[Institution alloc] initWithDictionary:[json objectForKey:@"institution_details_json"] error:&err];
    self.successfulAttemptUser = [[User alloc] initWithDictionary:[json objectForKey:@"user_details_json"] error:&err];
    self.successfulAttemptFinder = [[FinderProfile alloc] initWithDictionary:json error:&err];
    [self afterGetInit];
}


@end
