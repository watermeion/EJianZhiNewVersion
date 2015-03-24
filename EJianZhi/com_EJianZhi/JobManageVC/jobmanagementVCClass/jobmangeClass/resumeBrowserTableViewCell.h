//
//  TableViewCell.h
//  com_EJianZhi
//
//  Created by Mac on 2/1/15.
//  Copyright (c) 2015 Studio Of Spicy Hot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface resumeBrowserTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end
