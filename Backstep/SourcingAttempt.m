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

// add this attempt's found item id to a comma separated list of id's, so we don't show the item in search results
- (void) afterCreate:(id) json
{
    NSString *foundItemIds = [PlistOperations getFoundItemAttempts];
    
    NSDictionary *newFoundItemDict = [json objectForKey:@"found_item"];
    NSString *newFoundItemId = [[newFoundItemDict objectForKey:@"id"] stringValue];
    
    NSString *newIdsString;
    if (foundItemIds) {
        newIdsString = [NSString stringWithFormat:@"%@,%@", foundItemIds, newFoundItemId];
    } else {
        newIdsString = newFoundItemId;
    }
    
    [PlistOperations writeToPlist: [NSArray arrayWithObjects: newIdsString, nil]
                             keys: [NSArray arrayWithObjects: @"attempt_ids", nil]
                         doAppend: YES];
}


@end
