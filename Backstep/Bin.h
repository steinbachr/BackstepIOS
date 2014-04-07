//
//  Bin.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "JSONModel.h"
#import "Gettable.h"
#import "Tabular.h"
#import "BackstepModel.h"

@interface Bin : JSONModel<Gettable, Tabular, BackstepModel>

@property NSString *id;
@property NSString *name;
@property NSString *description;
@property NSString<Optional> *picture;

// Bins gettable relies on knowing the Institution id, so we override here
+ (void)get:(UIViewController<GettableController> *)controller filterType:(NSString *)filterType filterId:(NSString *)filterId;

@end
