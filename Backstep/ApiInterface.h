//
//  ApiInterface.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Creatable.h"

@interface ApiInterface : NSObject

+ (void)create:(JSONModel<Creatable> *)jsonObj url:(NSString *)url indicator:(UIActivityIndicatorView *)indicator;

@end
