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
#import "SourcingAttempt.h"

@implementation FoundItem


- (UIImage *)pictureAsImage
{
    return [Images pictureAsImage:self.picture];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", self.color, self.type];
}

+ (void)get:(UIViewController<GettableController> *)controller binId:(NSString *)binId
{
    NSString *url = [NSString stringWithFormat:@"http://www.back-step.com/api/found/?bin=%@", binId];
    [ApiInterface getList:url controller:controller];
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

// Tabular Implementations
- (UIImage *)rowPicture
{
    UIImage *image = [self pictureAsImage];
    if (image) {
        return image;
    } else {
        return [UIImage imageNamed:@"missing_picture_icon"];
    }
}

- (NSString *)rowTitle
{
    return [self description];
}

- (NSString *) rowSubtitle
{
    return self.identifying_characteristics;
}

@end
