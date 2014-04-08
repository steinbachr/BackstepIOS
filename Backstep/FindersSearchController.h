//
//  LocationSearchController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GettableController.h"
#import "City.h"

@interface FindersSearchController : UIViewController<UITableViewDelegate, UITableViewDataSource, GettableController>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *filterSegment;

@property City *selectedCity;
@property NSMutableArray *finders;
@property NSMutableArray *filtered;

@end
