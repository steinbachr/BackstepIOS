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
// this method writes the statusURL and normalized description to Data.plist
- (void)saveItem
{
    NSString *error;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"Data.plist"];
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects:
                              [NSArray arrayWithObjects: self.lostItem.status_url, self.lostItem.description, nil]
                              forKeys:[NSArray arrayWithObjects: @"status_url", @"description", nil]];
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict
                                                                   format:NSPropertyListXMLFormat_v1_0
                                                         errorDescription:&error];
    
    if (plistData) {
        [plistData writeToFile:plistPath atomically:YES];
    }
}

- (void)submitItem
{
    [JSONHTTPClient postJSONFromURLWithString:@"http://www.back-step.com/api/items/"
                                   bodyString:[self.lostItem toJSONString]
                                   completion:^(id json, JSONModelError *err) {
                                       self.lostItem.status_url = [json objectForKey:@"status_url"];
                                       self.lostItem.description = [json objectForKey:@"description"];
                                       
                                       [self saveItem];
                                   }];
}
@end
