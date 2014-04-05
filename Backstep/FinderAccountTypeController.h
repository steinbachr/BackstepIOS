//
//  FinderAccountTypeController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/5/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FinderProfile.h"

@interface FinderAccountTypeController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *typePicker;
@property (strong, nonatomic)   NSArray *typesArray;
@property FinderProfile* finder;

@end
