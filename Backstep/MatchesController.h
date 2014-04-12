//
//  MatchesController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GettableController.h"

@interface MatchesController : UITableViewController <GettableController>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *items;

@end
