//
//  PlistOperations.h
//  Backstep
//
//  Created by Robert Steinbach on 3/21/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistOperations : NSObject

+(NSString *) pListPath;
+(void) writeToPlist:(NSArray *)vals keys:(NSArray *)keys;
+(NSDictionary *) openPlist;
+(void) deletePlist;

@end
