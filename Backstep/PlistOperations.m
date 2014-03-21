//
//  PlistOperations.m
//  Backstep
//
//  Created by Robert Steinbach on 3/21/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "PlistOperations.h"

@implementation PlistOperations

+(NSString *) pListPath
{
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"Data.plist"];
    
    return plistPath;
}

@end
