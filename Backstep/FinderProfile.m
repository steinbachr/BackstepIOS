//
//  FinderProfile.m
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "FinderProfile.h"
#import "ApiInterface.h"

@implementation FinderProfile

// Createable Implementations
- (void) create:(UIActivityIndicatorView *)indicator
{
    [ApiInterface create: self
                     url: @"http://www.back-step.com/api/finders/"
               indicator: indicator];
}

- (void) afterCreate:(id) json
{
    self.id = [json objectForKey:@"id"];
}

@end
