//
//  FoundSearchController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GettableController.h"
#import "CreatableController.h"

@interface FoundSearchController : UITableViewController<UITableViewDataSource, UITableViewDelegate, GettableController, CreatableController>

@property NSInteger currentAttemptIndex;
@property NSString *binId;
@property NSMutableArray *items;

@end
