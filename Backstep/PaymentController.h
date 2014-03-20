//
//  PaymentController.h
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LostItem.h"
#import "STPView.h"

@interface PaymentController : UIViewController <STPViewDelegate>

@property STPView* stripeView;
@property LostItem *lostItem;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;

@end
