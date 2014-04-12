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
    [self.user create:self.indicator controller:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FinderAccountInstitutionController *dest = [segue destinationViewController];
    NSDictionary *instCategories = [Institution institutionCategories];
    
    /* set the destination title to the human readable institution category */
    dest.title = [instCategories objectForKey:self.finder.institution_category];
    dest.finder = self.finder;
}

/**-- CreatableController Implementations --**/
- (void)afterCreate
{
    //since we just move onto the next step right away, theres nothing to do here
}

@end
