//
//  Institution.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "JSONModel.h"
#import "Gettable.h"
#import "Tabular.h"
#import "BackstepModel.h"

@interface Institution : JSONModel<Gettable, Tabular, BackstepModel>

@property NSString *id;
@property NSString *name;
@property NSString *category;
@property NSString *phone_preferred;
@property NSString *email_preferred;

// fetched in GET requests, not required in POST
@property NSString<Optional> *phone;
@property NSString<Optional> *city;
@property NSString<Optional> *state;
@property NSString<Optional> *address;

// Institution gettable relies on knowing the cityId, so we override here
+ (void) get:(UIViewController<GettableController> *)controller cityId:(NSString *)cityId;
- (UIImage *) iconForCategory;

@end
