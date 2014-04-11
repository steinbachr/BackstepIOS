//
//  ClaimRequestTableCell.h
//  Backstep
//
//  Created by Robert Steinbach on 4/11/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClaimRequestTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemDescription;
@property (weak, nonatomic) IBOutlet UILabel *itemCharacteristics;
@property (weak, nonatomic) IBOutlet UILabel *requestDeniedLabel;

@end
