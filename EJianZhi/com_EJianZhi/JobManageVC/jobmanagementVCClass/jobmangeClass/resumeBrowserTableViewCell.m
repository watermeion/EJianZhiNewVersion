//
//  TableViewCell.m
//  com_EJianZhi
//
//  Created by Mac on 2/1/15.
//  Copyright (c) 2015 Studio Of Spicy Hot. All rights reserved.
//

#import "resumeBrowserTableViewCell.h"

@implementation resumeBrowserTableViewCell

- (void)awakeFromNib {
    // Initialization code
    //设定图片圆角
    [self.profileImageView.layer setMasksToBounds:YES];
    [self.profileImageView.layer  setCornerRadius:self.profileImageView.bounds.size.width/2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
