//
//  MLNavigationViewController.m
//  com_EJianZhi
//
//  Created by Mac on 2/1/15.
//  Copyright (c) 2015 Studio Of Spicy Hot. All rights reserved.
//



//自定义NavigationController  设置和动画

#import "MLNavigationViewController.h"


#define NaviBarColor [UIColor colorWithRed:0.16 green:0.73 blue:0.65 alpha:1.0]
@interface MLNavigationViewController ()

@end

@implementation MLNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationBar.translucent=NO;
    //设置Navi 颜色
    [self.navigationBar setBarTintColor:NaviBarColor];

    self.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    NSMutableDictionary *titleBarAttributes = [NSMutableDictionary dictionaryWithDictionary:[[UINavigationBar appearance] titleTextAttributes]];
    [titleBarAttributes setValue:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    
    [self.navigationBar setTitleTextAttributes:titleBarAttributes];

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
