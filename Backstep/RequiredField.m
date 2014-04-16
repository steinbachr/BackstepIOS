//
//  RequiredField.m
//  Backstep
//
//  Created by Robert Steinbach on 4/16/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "RequiredField.h"

@implementation RequiredField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL) performCheck
{
    NSString *title = @"All fields required";
    NSString *message = @"Sorry! All fields are required to continue";
    if ([self.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    
    return YES;
}



@end
