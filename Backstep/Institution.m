//
//  Institution.m
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "Institution.h"
#import "ApiInterface.h"

@implementation Institution

// Gettable Implementations
+ (void)get:(UIViewController<GettableController> *)controller
{
    NSString *url = @"http://www.back-step.com/api/institutions/?has_bins=true";
    [ApiInterface getList:url controller:controller];
}


// Tabular Implementations
- (UIImage *)rowPicture
{
    return [UIImage imageNamed:@"school_icon"];
}

- (NSString *)rowTitle
{
    return self.name;
}

- (NSString *) rowSubtitle
{
    return @"";
}

@end
