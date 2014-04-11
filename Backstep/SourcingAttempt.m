//
//  SourcingAttempt.m
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "SourcingAttempt.h"
#import "PlistOperations.h"
#import "ApiInterface.h"

@implementation SourcingAttempt

+ (void)get:(UIViewController<GettableController> *)controller lostId:(NSString *)lostId
{
    NSString *url = [NSString stringWithFormat:@"http://www.back-step.com/api/attempts/?lost_item=%@", lostId];
    [ApiInterface getList:url controller:controller];
}

- (void)getFinder:(UIViewController<GettableController> *)controller
{
    NSString *url = [NSString stringWithFormat:@"http://www.back-step.com/api/attempts/%@/finder/", self.id];
    [ApiInterface getList:url controller:controller];
}

// Gettable Implementations
+ (void)get:(UIViewController<GettableController> *)controller
{
    NSString *url = [NSString stringWithFormat:@"http://www.back-step.com/api/attempts/?finder=%@", [PlistOperations getFinderId]];
    [ApiInterface getList:url controller:controller];
}


// Createable Implementations
- (void) create:(UIActivityIndicatorView *)indicator controller:(UIViewController<CreatableController> *)controller
{
    [ApiInterface createThenDo: self
                           url: @"http://www.back-step.com/api/attempts/"
                     indicator: indicator
                    controller: controller];
}

- (void) afterCreate:(id) json
{
}


@end
