//
//  CreatableController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>

//CreatableController's define a single method, afterCreate, which specifies what action to take after the Creatable contained inside this
//CreatableController is created
@protocol CreatableController <NSObject>

- (void)afterCreate;

@end
