//
//  ConfirmationController.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "ConfirmationController.h"
#import "JSONHTTPClient.h"

@interface ConfirmationController ()

@end

@implementation ConfirmationController

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
    
    [self.confirmButton addTarget:self action:@selector(submitItem) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/***--- Submit New Lost Item ---***/
- (void)submitItem
{
    [JSONHTTPClient postJSONFromURLWithString:@"http://www.back-step.com/api/items/"
                                   bodyString:[self.lostItem toJSONString]
                                   completion:^(id json, JSONModelError *err) {
                                       NSLog(err.description);                                       
                                   }];
}
@end
