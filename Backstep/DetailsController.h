//
//  DetailsController.h
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LostItem.h"
#import "CreatableController.h"
#import "RequiredField.h"

@interface DetailsController : UIViewController<CreatableController>


@property (weak, nonatomic) IBOutlet RequiredField *characteristicsTextField;
@property LostItem *lostItem;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;

@end
