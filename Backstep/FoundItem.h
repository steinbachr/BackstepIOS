//
//  FoundItem.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "JSONModel.h"
#import "Gettable.h"
#import "Creatable.h"
#import "Tabular.h"

@interface FoundItem : JSONModel<Gettable, Creatable, Tabular>

@property NSString *id;
@property NSString *finder;
@property NSString *type;
@property NSString *color;
@property NSString *identifying_characteristics;
@property NSString<Optional> *picture;

- (UIImage *)pictureAsImage;
- (NSString *)description;

// when a user is looking at found items in a bin, we require knowledge of the bin, so use a specific implementation of get
+ (void)get:(UIViewController<GettableController> *)controller binId:(NSString *)binId;

@end
