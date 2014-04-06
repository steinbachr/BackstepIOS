//
//  PlistOperations.h
//  Backstep
//
//  Created by Robert Steinbach on 3/21/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistOperations : NSObject

// Generic methods
+ (NSString *) pListPath;
+ (void) writeToPlist:(NSArray *)vals keys:(NSArray *)keys doAppend:(BOOL)doAppend;
+ (NSDictionary *) openPlist;
+ (void) deletePlist;
+ (NSString *) plistVal:(NSString *)key;

// Specific methods
+ (NSString *) getFinderId;

@end
