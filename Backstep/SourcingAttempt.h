//
//  SourcingAttempt.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "JSONModel.h"
#import "Gettable.h"
#import "Creatable.h"
#import "FoundItem.h"
#import "LostItem.h"
#import "Institution.h"

@interface SourcingAttempt : JSONModel<Gettable, Creatable>

@property NSString *id;
@property LostItem *lost_item;
@property FoundItem *found_item;
@property NSString<Optional> *success;
@property NSString<Optional> *challenge_question;
@property NSString<Optional> *challenge_answer;

// get attempts for a lost item (this is the method used from the loser branch of the application)
+ (void)get:(UIViewController<GettableController> *)controller lostId:(NSString *)lostId;
// get the finder for a specific sourcing attempt
- (void)getFinder:(UIViewController<GettableController> *)controller;
// because we're using success as a string instead of bool, these functions proxy the boolean nature of success
- (BOOL)successAsBool;
- (BOOL)isFailure;

@end
