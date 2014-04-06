//
//  User.m
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "User.h"
#import "ApiInterface.h"
#import "CreatableController.h"

@implementation User

// Createable Implementations
- (void) create:(UIActivityIndicatorView *)indicator controller:(UIViewController<CreatableController> *)controller
{
    [ApiInterface createThenDo: self
                           url: @"http://www.back-step.com/api/users/"
                     indicator: indicator
                    controller: controller];
}

- (void) afterCreate:(id) json
{
    self.id = [json objectForKey:@"id"];
    self.email = [json objectForKey:@"email"];
    self.finder.user = self.id;
}

@end
