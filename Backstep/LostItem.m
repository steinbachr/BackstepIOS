//
//  LostItem.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "LostItem.h"
#import "MyItemController.h"
#import "PlistOperations.h"
#import "JSONHTTPClient.h"
#import "ApiInterface.h"
#import "CreatableController.h"

@implementation LostItem

NSString * InfoRequiredTitle = @"All fields required";
NSString * InfoRequiredMessage = @"We want to find your item as much as you do! So please give us all of the information we'll need to track it down.";


// this method writes the statusURL and normalized description to Data.plist
- (void)saveItem:(LostItem *)item controller:(UIViewController *)controller
{
    NSString *error;
    NSString *plistPath = [PlistOperations pListPath];
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects:
                               [NSArray arrayWithObjects: item.status_url, self.description, nil]
                                                          forKeys:[NSArray arrayWithObjects: @"status_url", @"description", nil]];
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict
                                                                   format:NSPropertyListXMLFormat_v1_0
                                                         errorDescription:&error];
    
    if (plistData) {
        [plistData writeToFile:plistPath atomically:YES];
        
        MyItemController *myItemController = [controller.storyboard instantiateViewControllerWithIdentifier:@"myItemController"];
        [controller presentViewController:myItemController animated:NO completion:nil];
    }
}

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
    self.status_url = [json objectForKey:@"status_url"];
    self.description = [json objectForKey:@"description"];
    
    
    [PlistOperations writeToPlist: [NSArray arrayWithObjects: self.id, self.status_url, self.description, nil]
                             keys: [NSArray arrayWithObjects: @"item_id", @"status_url", @"description", nil]
                         doAppend: YES];
}

@end
