//
//  PlistOperations.m
//  Backstep
//
//  Created by Robert Steinbach on 3/21/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "PlistOperations.h"

@implementation PlistOperations

+ (NSString *) pListPath
{
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"Data.plist"];
    
    return plistPath;
}

+ (void) writeToPlist:(NSArray *)vals keys:(NSArray *)keys
{
    NSString *error;
    NSString *plistPath = [PlistOperations pListPath];
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: vals forKeys:keys];
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict
                                                                   format:NSPropertyListXMLFormat_v1_0
                                                         errorDescription:&error];
    
    if (plistData) {
        [plistData writeToFile:plistPath atomically:YES];
    }
}

+ (NSDictionary *) openPlist
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath = [PlistOperations pListPath];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    }
    
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&errorDesc];
    
    return temp;
}

+ (void) deletePlist
{
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:[PlistOperations pListPath] error:&error];
}

@end
