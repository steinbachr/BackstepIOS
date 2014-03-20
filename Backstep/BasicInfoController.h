//
//  BasicInfoController.h
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LostItem.h"

@interface BasicInfoController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic)     IBOutlet UIPickerView *color;
@property (strong, nonatomic)   NSArray *colorArray;
@property (weak, nonatomic)     IBOutlet UIPickerView *type;
@property (strong, nonatomic)   NSArray *typeArray;

@property LostItem              *lostItem;

@end
