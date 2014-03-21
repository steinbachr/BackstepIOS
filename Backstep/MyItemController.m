//
//  MyItemController.m
//  Backstep
//
//  Created by Robert Steinbach on 3/20/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "MyItemController.h"
#import "PlistOperations.h"

@interface MyItemController ()

@end

@implementation MyItemController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSDictionary *)openPlist
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath = [PlistOperations pListPath];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    }
    
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&errorDesc];
    
    return temp;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *plist = [self openPlist];
    NSString *itemDescription = [plist objectForKey:@"description"];
    NSMutableString *fullyQualifiedUrl = [NSMutableString string];
    NSString *itemUrl = [plist objectForKey:@"status_url"];
    
    [fullyQualifiedUrl appendString:@"http://www.back-step.com"];
    [fullyQualifiedUrl appendString:itemUrl];

    self.itemName.text = itemDescription;
    [self.itemWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:fullyQualifiedUrl]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
