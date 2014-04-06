//
//  Gettable.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GettableController.h"

@protocol Gettable <NSObject>

+ (void)get:(UIViewController<GettableController> *)controller;

@end
