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

@implementation FoundItem


+ (void)get:(UIViewController<GettableController> *)controller
{
    NSString *url = [NSString stringWithFormat:@"http://www.back-step.com/api/found/?finder=%@", [PlistOperations getFinderId]];
    [ApiInterface getList:url controller:controller];
}

- (UIImage *)pictureAsImage
{
    NSURL *url = [NSURL URLWithString:self.picture];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    
    return image;
}

@end
