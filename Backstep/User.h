//
//  User.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Creatable.h"
#import "FinderProfile.h"

@interface User : JSONModel<Creatable>

@property NSString *id;
@property NSString *email;
@property NSString *password;

// we need to know about a finder instance so that we can set the user id for the finder after this user is created
// on the server
@property FinderProfile *finder;

@end
