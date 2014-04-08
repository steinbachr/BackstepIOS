//
//  BinSearchController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gettable.h"
#import "GettableController.h"

@interface BinSearchController : UITableViewController<UITableViewDelegate, UITableViewDataSource, GettableController>

@property NSString *binCreatorId;
@property NSMutableArray *bins;

@end
