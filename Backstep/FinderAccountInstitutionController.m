//
//  FinderAccountInstitutionController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "FinderAccountInstitutionController.h"
#import "FinderHomeController.h"
#import "Institution.h"

@interface FinderAccountInstitutionController ()

@end

@implementation FinderAccountInstitutionController

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
    
    NSDictionary *instCategories = [Institution institutionCategories];
    /* set the institution text placeholder to the human readable institution category */
    self.institutionText.placeholder = [NSString stringWithFormat:@"%@ Name",
                                        [instCategories objectForKey:self.finder.institution_category]];
    
    [self.nextButton addTarget:self action:@selector(createFinder) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**-- Button Actions --**/
- (void)createFinder
{
    if ([self.institutionText performCheck]) {
        self.finder.institution = self.institutionText.text;
        [self.finder create:self.indicator controller:self];
    }
}


/**-- CreatableController Implementations --**/
- (void)afterCreate
{
    FinderHomeController *finderHome = [self.storyboard instantiateViewControllerWithIdentifier:@"finderProfileHome"];
    [self presentViewController:finderHome animated:NO completion:nil];
}

@end
