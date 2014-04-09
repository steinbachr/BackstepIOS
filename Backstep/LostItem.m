//
//  LostItem.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "LostItem.h"
#import "PlistOperations.h"
#import "JSONHTTPClient.h"
#import "ApiInterface.h"
#import "CreatableController.h"

@implementation LostItem

NSString * InfoRequiredTitle = @"All fields required";
NSString * InfoRequiredMessage = @"We want to find your item as much as you do! So please give us all of the information we'll need to track it down.";


// Createable Implementations
- (void) create:(UIActivityIndicatorView *)indicator controller:(UIViewController<CreatableController> *)controller
{
    [ApiInterface createThenDo: self
                           url: @"http://www.back-step.com/api/items/"
                     indicator: indicator
                    controller: controller];
}

- (void) afterCreate:(id) json
{
    self.id = [json objectForKey:@"id"];
    
    [PlistOperations writeToPlist: [NSArray arrayWithObjects: self.id, [self toJSONString], nil]
                             keys: [NSArray arrayWithObjects: @"id", @"item_json", nil]
                         doAppend: YES];
}

@end
