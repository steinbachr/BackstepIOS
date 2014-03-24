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

// this method creates a lost item on the server and then writes the response to our .plist file
+ (void)submitItem:(LostItem *)item controller:(UIViewController *)controller indicator:(UIActivityIndicatorView *)indicator
{
    indicator.hidden = NO;
    [JSONHTTPClient postJSONFromURLWithString:@"http://www.back-step.com/api/items/"
                                   bodyString:[item toJSONString]
                                   completion:^(id json, JSONModelError *err) {
                                       if ([json objectForKey:@"error"]) {
                                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops we have a problem"
                                                                                           message:[json objectForKey:@"error"]
                                                                                          delegate:nil
                                                                                 cancelButtonTitle:@"OK"
                                                                                 otherButtonTitles:nil];
                                           [alert show];
                                           indicator.hidden = YES;
                                       } else {
                                           item.status_url = [json objectForKey:@"status_url"];
                                           item.description = [json objectForKey:@"description"];
                                           
                                           [item saveItem:item controller:controller];
                                       }
                                   }];
}

@end
