//
//  CheckInViewController.h
//  com_EJianZhi
//
//  Created by Mac on 2/1/15.
//  Copyright (c) 2015 Studio Of Spicy Hot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *switchJobButton;
@property (weak, nonatomic) IBOutlet UILabel *timestrampLabel;

//第二view


@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)showUncheckedAction:(id)sender;

- (IBAction)showCheckedAction:(id)sender;

//第三个界面

@property (weak, nonatomic) IBOutlet UIView *thirdView;
@property (weak, nonatomic) IBOutlet UIButton *scanBtn;
- (IBAction)scanAction:(id)sender;

@end
