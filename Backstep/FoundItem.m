//
//  FoundItem.m
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "FoundItem.h"
#import "ApiInterface.h"
#import "PlistOperations.h"
#import "Images.h"

@implementation FoundItem


- (UIImage *)pictureAsImage
{
    return [Images pictureAsImage:self.picture];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", self.color, self.type];
}

// Gettable Implementations
+ (void)get:(UIViewController<GettableController> *)controller
{
    NSString *url = [NSString stringWithFormat:@"http://www.back-step.com/api/found/?finder=%@", [PlistOperations getFinderId]];
    [ApiInterface getList:url controller:controller];
}


// Createable Implementations
- (void) create:(UIActivityIndicatorView *)indicator controller:(UIViewController<CreatableController> *)controller
{
    [ApiInterface createThenDo: self
                           url: @"http://www.back-step.com/api/found/"
                     indicator: indicator
                    controller: controller];
}

- (void) afterCreate:(id) json
{
}

@end
