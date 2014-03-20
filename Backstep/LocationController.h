//
//  LocationController.h
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic)     IBOutlet UIPickerView *state;
@property (strong, nonatomic)   NSArray *statesArray;

@end
