//
//  ConfirmationController.h
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LostItem.h"

@interface ConfirmationController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property LostItem *lostItem;

@end
