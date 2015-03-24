//
//  JobListForComTableViewCell.h
//  com_EJianZhi
//
//  Created by Mac on 2/1/15.
//  Copyright (c) 2015 Studio Of Spicy Hot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "listBadgeView.h"
@interface JobListForComTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet listBadgeView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *payWayLabel;
@property (weak, nonatomic) IBOutlet UILabel *keyWord1Label;
@property (weak, nonatomic) IBOutlet UILabel *keyWord2Label;

@end
