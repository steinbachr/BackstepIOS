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
@property NSString *phone_preferred;
@property NSString *email_preferred;

@end
