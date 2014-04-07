//
//  Images.m
//  Backstep
//
//  Created by Robert Steinbach on 4/7/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "Images.h"

@implementation Images

// given the url to a picture, convert it to a UIImage
+ (UIImage *)pictureAsImage:(NSString *)pictureUrl
{
    NSURL *url = [NSURL URLWithString:pictureUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    
    return image;
}

@end
