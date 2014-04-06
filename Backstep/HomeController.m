//
//  HomeController.m
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "HomeController.h"
#import "PlistOperations.h"

@interface HomeController ()

@end

@implementation HomeController

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
    //[PlistOperations deletePlist]; //DEBUGGING!!!
    //see if we've already made a choice of what type of user we want to be.
    if ([self userChosenType]) {
        NSString *identifier = @"lost_item_first";
        if ([self userSelectedFinder]) {
            identifier = @"finder_first";
        }
        
        UIViewController *nc = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        UINavigationController *newNavigation = [[UINavigationController alloc] initWithRootViewController:nc];
        [self presentViewController:newNavigation animated:NO completion:nil];
    }
    
    [self.finderButton addTarget:self action:@selector(setFinderType) forControlEvents:UIControlEventTouchUpInside];
    [self.lostButton addTarget:self action:@selector(setLostType) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//** Helpers **//
- (void)setType:(NSString *)type
{
    NSArray* vals = [NSArray arrayWithObjects: type, nil];
    NSArray* keys = [NSArray arrayWithObjects: @"user_type", nil];
    [PlistOperations writeToPlist:vals keys:keys doAppend:NO];
}

// check if the user has made an indication of what type of user they are
- (BOOL)userChosenType
{
    NSDictionary* plist = [PlistOperations openPlist];
    if ([plist objectForKey:@"user_type"]) {
        return YES;
    } else {
        return NO;
    }
}

// check if the user has indicated they are a finder
- (BOOL)userSelectedFinder
{
    NSDictionary* plist = [PlistOperations openPlist];
    NSString* userType = [plist objectForKey:@"user_type"];
    return [userType isEqualToString:@"finder"];
}


//** Button Actions **//
- (void)setFinderType
{
    [self setType:@"finder"];
}

- (void)setLostType
{
    [self setType:@"lost"];
}
@end
