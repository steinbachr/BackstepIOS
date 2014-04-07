//
//  Bin.m
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "Bin.h"
#import "ApiInterface.h"
#import "Images.h"

@implementation Bin

// Gettable Implementations
+ (void)get:(UIViewController<GettableController> *)controller
{
    NSString *url = @"http://www.back-step.com/api/bins/";
    [ApiInterface getList:url controller:controller];
}

+ (void)get:(UIViewController<GettableController> *)controller filterType:(NSString *)filterType filterId:(NSString *)filterId
{
    NSString *url = [NSString stringWithFormat:@"http://www.back-step.com/api/bins/?%@=%@", filterType, filterId];
    [ApiInterface getList:url controller:controller];
}

// Tabular Implementations
- (UIImage *)rowPicture
{
    if (self.picture) {
        return [Images pictureAsImage:self.picture];
    } else {
        return [UIImage imageNamed:@"missing_image_icon"];
    }
}

- (NSString *)rowTitle
{
    return self.name;
}

- (NSString *) rowSubtitle
{
    return self.description;
}

@end
