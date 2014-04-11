//
//  SuccessfulClaimController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/8/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SourcingAttempt.h"
#import "Institution.h"
#import "GettableController.h"
#import "FinderProfile.h"
#import "User.h"

@interface SuccessfulClaimController : UIViewController<GettableController>

@property (weak, nonatomic) IBOutlet UIImageView *finderImage;
@property (weak, nonatomic) IBOutlet UILabel *finderName;
@property (weak, nonatomic) IBOutlet UILabel *finderEmail;
@property (weak, nonatomic) IBOutlet UILabel *finderPhone;
@property (weak, nonatomic) IBOutlet UILabel *finderCity;
@property (weak, nonatomic) IBOutlet UILabel *finderState;
@property (weak, nonatomic) IBOutlet UILabel *finderAddress;


@property Institution *successfulAttemptInst;
@property FinderProfile *successfulAttemptFinder;
@property User *successfulAttemptUser;
@property SourcingAttempt *successfulAttempt;

@end
