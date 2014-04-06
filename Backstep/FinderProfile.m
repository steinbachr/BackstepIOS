//
//  FinderProfile.m
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "FinderProfile.h"
#import "ApiInterface.h"
#import "PlistOperations.h"
#import "CreatableController.h"

@implementation FinderProfile

// Createable Implementations
- (void) create:(UIActivityIndicatorView *)indicator controller:(UIViewController<CreatableController> *)controller
{
    [ApiInterface createThenDo: self
                           url: @"http://www.back-step.com/api/finders/"
                     indicator: indicator
                    controller: controller];
}

- (void) afterCreate:(id) json
{
    self.id = [json objectForKey:@"id"];
    [PlistOperations writeToPlist: [NSArray arrayWithObjects: self.id, nil]
                             keys: [NSArray arrayWithObjects: @"finder_id", nil]
                         doAppend: YES];
}

@end
