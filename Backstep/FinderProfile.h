//
//  FinderProfile.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface FinderProfile : JSONModel

@property NSInteger id;
@property NSInteger user;
@property NSInteger institution;
@property NSString *name;
@property NSString *is_individual;

@end
