//
//  FinderAccountInstitutionController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FinderProfile.h"
#import "CreatableController.h"

@interface FinderAccountInstitutionController : UIViewController<CreatableController>

@property (weak, nonatomic) IBOutlet UITextField *institutionText;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property FinderProfile *finder;

@end
