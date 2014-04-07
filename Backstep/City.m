//
//  City.m
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "City.h"
#import "ApiInterface.h"

@implementation City

// Gettable Implementations
+ (void)get:(UIViewController<GettableController> *)controller
{
    NSString *url = @"http://www.back-step.com/api/cities/?has_bins=true";
    [ApiInterface getList:url controller:controller];
}


// Tabular Implementations
+ (UIImage *)rowPicture
{
    return [UIImage imageNamed:@"city_icon"];
}

- (NSString *)rowTitle
{
    return self.name;
}

@end
