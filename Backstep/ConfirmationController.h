//
//  ConfirmationController.h
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LostItem.h"
#import "CreatableController.h"

@interface ConfirmationController : UIViewController<CreatableController>

@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property LostItem *lostItem;

@end
