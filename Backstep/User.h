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

//needed for writing, not for reading
@property FinderProfile<Optional> *finder;
@property NSString<Optional> *password;

@end
