//
//  LostItem.h
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Creatable.h"

@interface LostItem : JSONModel<Creatable>

@property NSString *id;
@property NSString *loser_name;
@property NSString *loser_email;
@property NSString *color;
@property NSString *type;
@property NSString<Optional> *state;
@property NSString *city;
@property NSString *identifying_characteristics;
@property NSString<Optional> *charge_token;

// both returned as a result from a succesful POST
@property NSString<Optional> *status_url;
@property NSString<Optional> *description;

@end
