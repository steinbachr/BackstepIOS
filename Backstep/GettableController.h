//
//  GettableController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol GettableController <NSObject>

- (void)afterGet:(id) json;

@end
