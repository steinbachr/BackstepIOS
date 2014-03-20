//
//  LostItem.h
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface LostItem : JSONModel

@property NSString *loser_name;
@property NSString *loser_email;
@property NSString *color;
@property NSString *type;
@property NSString *state;
@property NSString *city;
@property NSString *identifying_characteristics;

@end
