//
//  RequiredField.h
//  Backstep
//
//  Created by Robert Steinbach on 4/16/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequiredField : UITextField

// check if this text field has a value, if not show an alert and return NO else return YES
-(BOOL) performCheck;

@end
