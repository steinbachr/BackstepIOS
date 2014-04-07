//
//  MatchTableViewCell.h
//  Backstep
//
//  Created by Robert Steinbach on 4/6/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *foundItemImg;
@property (weak, nonatomic) IBOutlet UILabel *foundItemDesc;
@property (weak, nonatomic) IBOutlet UIImageView *lostItemImg;
@property (weak, nonatomic) IBOutlet UILabel *lostItemDesc;

@end
