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


+ (void)get:(UIViewController<GettableController> *)controller cityId:(NSString *)cityId
{
    NSString *url = [NSString stringWithFormat:@"http://www.back-step.com/api/cities/%@/finders/", cityId];
    [ApiInterface getList:url controller:controller];
}

// Gettable Implementations
+ (void)get:(UIViewController<GettableController> *)controller
{
    NSString *url = @"http://www.back-step.com/api/institutions/?has_bins=true";
    [ApiInterface getList:url controller:controller];
}


// Tabular Implementations
- (UIImage *)rowPicture
{
    if ([self.category isEqualToString:@"school"]) {
        return [UIImage imageNamed:@"school_icon"];
    } else {
        return [UIImage imageNamed:@"police_icon"];
    }
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
