//
//  MLSelectInffShow.m
//  EJianZhi
//
//  Created by RAY on 15/2/6.
//  Copyright (c) 2015年 麻辣工作室. All rights reserved.
//

#import "MLSelectInffShow.h"
#import "QRadioButton.h"

@interface MLSelectInffShow ()<QRadioButtonDelegate>

@end

@implementation MLSelectInffShow

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确认选择" style:UIBarButtonItemStylePlain target:self action:@selector(touchOK)];
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
    [self RadioBtnInit];
}

- (void)RadioBtnInit{
    QRadioButton *_radio1 = [[QRadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    _radio1.frame = CGRectMake(20, 80, 200, 40);
    [_radio1 setTitle:@"对所有人可见" forState:UIControlStateNormal];
    [_radio1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_radio1.titleLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
    [self.view addSubview:_radio1];
    [_radio1 setChecked:YES];
    
    QRadioButton *_radio2 = [[QRadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    _radio2.frame = CGRectMake(20, 140, 200, 40);;
    [_radio2 setTitle:@"对所有个人不可见" forState:UIControlStateNormal];
    [_radio2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_radio2.titleLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
    [self.view addSubview:_radio2];
    
    QRadioButton *_radio3 = [[QRadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    _radio3.frame = CGRectMake(20, 200, 200, 40);;
    [_radio3 setTitle:@"对所有同校校友可见" forState:UIControlStateNormal];
    [_radio3 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_radio3.titleLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
    [self.view addSubview:_radio3];
    
    QRadioButton *_radio4 = [[QRadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    _radio4.frame = CGRectMake(20, 260, 200, 40);;
    [_radio4 setTitle:@"所有人必须经过我的认可" forState:UIControlStateNormal];
    [_radio4 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_radio4.titleLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
    [self.view addSubview:_radio4];

}

- (void)touchOK{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
