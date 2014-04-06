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
    [PlistOperations writeToPlist:vals keys:keys];
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
