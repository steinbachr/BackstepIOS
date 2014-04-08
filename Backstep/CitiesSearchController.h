//
//  CitiesSearchController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/7/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GettableController.h"

@interface CitiesSearchController : UITableViewController<GettableController>

@property NSMutableArray *cities;

@end
