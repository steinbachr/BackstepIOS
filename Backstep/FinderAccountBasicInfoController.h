//
//  FinderAccountBasicInfoController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FinderProfile.h"
#import "User.h"
#import "CreatableController.h"
#import "RequiredField.h"

@interface FinderAccountBasicInfoController : UIViewController<CreatableController>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet RequiredField *emailText;
@property (weak, nonatomic) IBOutlet RequiredField *nameText;
@property (weak, nonatomic) IBOutlet RequiredField *passwordText;

@property FinderProfile* finder;
@property User* user;

@end
