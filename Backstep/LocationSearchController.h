//
//  LocationSearchController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GettableController.h"

@interface LocationSearchController : UIViewController<UITableViewDelegate, UITableViewDataSource, GettableController>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *filterSegment;

@property NSString *currentFilter;
@property NSMutableArray *currentItems;
@property NSMutableArray *cities;
@property NSMutableArray *institutions;

@end
