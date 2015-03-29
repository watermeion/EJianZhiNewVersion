//
//  MLContactCell.m
//  EJianZhi
//
//  Created by RAY on 15/3/28.
//  Copyright (c) 2015年 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import "MLContactCell.h"

@implementation MLContactCell

- (void)awakeFromNib {
    
    [self.userPortraitView.layer setCornerRadius:CGRectGetHeight(self.userPortraitView.bounds)/2];
    [self.userPortraitView.layer setMasksToBounds:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
