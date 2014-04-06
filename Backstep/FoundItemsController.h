//
//  FountItemsController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GettableController.h"

@interface FoundItemsController : UIViewController <UITableViewDelegate, UITableViewDataSource, GettableController>

@property (strong, nonatomic) IBOutlet UITableView *itemsTable;
@property NSMutableArray *items;

@end
