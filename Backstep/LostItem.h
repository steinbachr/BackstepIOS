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

extern NSString *InfoRequiredTitle;
extern NSString *InfoRequiredMessage;

@property NSString *id;
@property NSString *loser_name;
@property NSString *loser_email;
@property NSString *color;
@property NSString *type;
@property NSString *state;
@property NSString *city;
@property NSString *identifying_characteristics;
@property NSString *charge_token;

// both returned as a result from a succesful POST
@property NSString *status_url;
@property NSString *description;

// this method writes the statusURL and normalized description to Data.plist
- (void)saveItem:(LostItem *)item controller:(UIViewController *)controller;
//this method saves the item on our server and then writes the response to our Data.plist
+ (void)submitItem:(LostItem *)item controller:(UIViewController *)controller indicator:(UIActivityIndicatorView *)indicator;

@end
