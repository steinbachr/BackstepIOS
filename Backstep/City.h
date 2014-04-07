//
//  City.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "JSONModel.h"
#import "Gettable.h"
#import "Tabular.h"

@interface City : JSONModel<Gettable, Tabular>

@property NSString *id;
@property NSString *name;

@end
