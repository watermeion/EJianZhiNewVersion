//
//  MLStudentCard.m
//  EJianZhi
//
//  Created by RAY on 15/2/6.
//  Copyright (c) 2015年 麻辣工作室. All rights reserved.
//

#import "MLStudentCard.h"

@interface MLStudentCard ()

@end

@implementation MLStudentCard

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳过此步" style:UIBarButtonItemStylePlain target:self action:@selector(passStep)];
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];

}

- (void)passStep{
    
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
