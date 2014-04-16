//
//  FinderAccountBasicInfoController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "FinderAccountBasicInfoController.h"
#import "FinderAccountInstitutionController.h"
#import "Institution.h"

@interface FinderAccountBasicInfoController ()

@end

@implementation FinderAccountBasicInfoController

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
    [self.nextButton addTarget:self action:@selector(createUser) forControlEvents:UIControlEventTouchUpInside];
    self.user = [[User alloc] init];
    self.user.finder = self.finder;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//** Button Actions **//
- (void)createUser
{
    self.user.email = self.emailText.text;
    self.user.password = self.passwordText.text;
    self.finder.name = self.nameText.text;
    if ([self.emailText performCheck] && [self.nameText performCheck] && [self.passwordText performCheck]) {
        [self.user create:self.indicator controller:self];
    }
}


/**-- CreatableController Implementations --**/
- (void)afterCreate
{
    FinderAccountInstitutionController *finderInstitutionController = [self.storyboard instantiateViewControllerWithIdentifier:@"finderInstitutionController"];
    finderInstitutionController.finder = self.finder;
    
    [self presentViewController:finderInstitutionController animated:NO completion:nil];
}

@end
