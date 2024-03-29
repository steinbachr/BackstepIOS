//
//  FinderProfile.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Creatable.h"

@interface FinderProfile : JSONModel<Creatable>

@property NSString *id;
@property NSString *user;
@property NSString *name;
@property NSString *institution;
@property NSString<Optional> *institution_category;

@end
