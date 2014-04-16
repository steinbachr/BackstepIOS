//
//  FirstViewController.h
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LostItem.h"
#import "RequiredField.h"

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet RequiredField *nameTextField;
@property (weak, nonatomic) IBOutlet RequiredField *emailTextField;

@property LostItem *lostItem;

@end
