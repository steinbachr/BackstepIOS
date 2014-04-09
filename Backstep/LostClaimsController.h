//
//  LostClaimsController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/8/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GettableController.h"
#import "SourcingAttempt.h"

@interface LostClaimsController : UITableViewController<GettableController>

@property NSArray* attempts;

@end
