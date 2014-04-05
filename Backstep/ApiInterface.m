//
//  ApiInterface.m
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "ApiInterface.h"
#import "JSONHTTPClient.h"
#import "Creatable.h"

@implementation ApiInterface


+ (void)create:(JSONModel<Creatable> *)jsonObj url:(NSString *)url indicator:(UIActivityIndicatorView *)indicator
{
    indicator.hidden = NO;
    [JSONHTTPClient postJSONFromURLWithString:url
                                   bodyString:[jsonObj toJSONString]
                                   completion:^(id json, JSONModelError *err) {
                                       if ([json objectForKey:@"error"]) {
                                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops we have a problem"
                                                                                           message:[json objectForKey:@"error"]
                                                                                          delegate:nil
                                                                                 cancelButtonTitle:@"OK"
                                                                                 otherButtonTitles:nil];
                                           [alert show];
                                           indicator.hidden = YES;
                                       } else {
                                           indicator.hidden = YES;
                                           [jsonObj afterCreate:json];
                                       }
                                   }];
}

@end
