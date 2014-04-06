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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *plist = [PlistOperations openPlist];
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
