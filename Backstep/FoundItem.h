//
//  FoundItem.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "JSONModel.h"
#import "Gettable.h"

@interface FoundItem : JSONModel<Gettable>

@property NSString *id;
@property NSString *type;
@property NSString *color;
@property NSString *identifying_characteristics;
@property NSString *picture;

- (UIImage *)pictureAsImage;

@end
