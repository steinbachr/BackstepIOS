//
//  Createable.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CreatableController.h"

// createables are models that can be created on our server through a POST request
@protocol Creatable <NSObject>

// make the POST request
- (void) create:(UIActivityIndicatorView *) indicator controller:(UIViewController<CreatableController> *)controller;
// called after the POST request succeeds
- (void) afterCreate:(id)json;

@end
