//
//  MLTabbarVC.m
//  EJianZhi
//
//  Created by RAY on 15/1/19.
//  Copyright (c) 2015年 麻辣工作室. All rights reserved.
//

#import "MLTabbarVC.h"
#import "commonMacro.h"
#import "MLNavigationViewController.h"

#import "MainPageViewController.h"

#import "JobManagementViewController.h"

#import "CheckInViewController.h"
#import "ComJobResumeViewController.h"

#import "ResumeVC.h"
@interface MLTabbarVC ()

@end

@implementation MLTabbarVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    [self initViewControllors];
     [self changeTabbarItemsStyle];
}


//初始化tabbarViewControllors
-(void)initViewControllors
{
    //第一页面
    MainPageViewController *firstVC=[[MainPageViewController alloc]init];
    
    MLNavigationViewController *firstNavi=[[MLNavigationViewController alloc]initWithRootViewController:firstVC];
  
    
    //第二个页面
    
    JobManagementViewController *secondVC=[[JobManagementViewController alloc]init];
    
        MLNavigationViewController *secondNavi=[[MLNavigationViewController alloc]initWithRootViewController:secondVC];
    
    
    
    //第三个页面
    CheckInViewController *checkInVC=[[CheckInViewController alloc]init];
    
    
    MLNavigationViewController *thirdNavi=[[MLNavigationViewController alloc]initWithRootViewController:checkInVC];
    
    
    //第四个页面
    ComJobResumeViewController *resumeVC=[[ComJobResumeViewController alloc]init];
    
    
    MLNavigationViewController *forthNavi=[[MLNavigationViewController alloc]initWithRootViewController:resumeVC];
    
    self.viewControllers=@[firstNavi,secondNavi,thirdNavi,forthNavi];
}

-(void)changeTabbarItemsStyle
{
    
    [self.tabBar setBarTintColor:[UIColor colorWithRed:0.90 green:0.39 blue:0.22 alpha:1.0]];
    
    
    UITabBar *tabBar=self.tabBar;
    tabBar.tintColor=[UIColor whiteColor];
    
    UITabBarItem *tabBarItem1=[tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2=[tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3=[tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4=[tabBar.items objectAtIndex:3];
//    UITabBarItem *tabBarItem5=[tabBar.items objectAtIndex:4];
    
    tabBarItem1.title=@"求职者";
//    tabBarItem1.image=[UIImage imageNamed:@"userTabbar"];
    
    tabBarItem2.title=@"消息";
//    tabBarItem2.image=[UIImage imageNamed:@"letter"];
    
    tabBarItem3.title=@"考勤维护";
//    tabBarItem3.image=[UIImage imageNamed:@"edit"];
    
    tabBarItem4.title=@"发布兼职";
    
//    [[self.tabBar.items objectAtIndex:0] setFinishedSelectedImage:[[UIImage imageNamed:@"home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] withFinishedUnselectedImage:[[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    
//    [[self.tabBar.items objectAtIndex:1] setFinishedSelectedImage:[[UIImage imageNamed:@"find_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] withFinishedUnselectedImage:[[UIImage imageNamed:@"find"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    
//    [[self.tabBar.items objectAtIndex:2] setFinishedSelectedImage:[[UIImage imageNamed:@"activity_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] withFinishedUnselectedImage:[[UIImage imageNamed:@"activity"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    
//    [[self.tabBar.items objectAtIndex:3] setFinishedSelectedImage:[[UIImage imageNamed:@"mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] withFinishedUnselectedImage:[[UIImage imageNamed:@"mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
//    [self.tabBar setSelectedImageTintColor: [UIColor colorWithRed:0.90 green:0.39 blue:0.22 alpha:1.0]];
    
}

- (void)viewWillLayoutSubviews{
    
    
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
