//
//  LocationController.h
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LostItem.h"
#import "RequiredField.h"

@interface LocationController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>


@property (weak, nonatomic) IBOutlet RequiredField *locationTextField;
@property (weak, nonatomic)     IBOutlet UIPickerView *state;
@property (strong, nonatomic)   NSArray *statesArray;

@property LostItem *lostItem;

@end
