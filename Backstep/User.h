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

@interface User : JSONModel<Creatable>

@property NSString *id;
@property NSString *email;
@property NSString *password;

@end
