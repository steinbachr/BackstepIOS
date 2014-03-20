//
//  PaymentController.h
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic)     IBOutlet UIPickerView *month;
@property (strong, nonatomic)   NSArray *monthsArray;
@property (weak, nonatomic) IBOutlet UIPickerView *year;
@property (strong, nonatomic)   NSArray *yearsArray;

@end
