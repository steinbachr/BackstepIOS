//
//  NewItemController.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoundItem.h"
#import "CreatableController.h"
#import "RequiredField.h"

@interface NewItemController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, CreatableController>

@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIPickerView *colorSpinner;
@property (weak, nonatomic) IBOutlet UIPickerView *categorySpinner;
@property (weak, nonatomic) IBOutlet RequiredField *identifyingText;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property FoundItem *foundItem;

@end
