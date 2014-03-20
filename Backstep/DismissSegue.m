//
//  DismissSegue.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "DismissSegue.h"

@interface DismissSegue ()

@end

@implementation DismissSegue

- (void)perform
{
    UIViewController *controller = self.sourceViewController;
    [controller.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
