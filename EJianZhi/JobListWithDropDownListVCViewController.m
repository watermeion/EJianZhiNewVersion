//
//  JobListWithDropDownListVCViewController.m
//  EJianZhi
//
//  Created by Mac on 3/27/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import "JobListWithDropDownListVCViewController.h"
#import "JobListTableViewController.h"
#import "DropDownListView.h"
#import "DropDownListViewModel.h"
#import "MapViewController.h"

@interface JobListWithDropDownListVCViewController ()
@property (strong,nonatomic) JobListTableViewController *tableList;
@property (strong,nonatomic) DropDownListViewModel *dropListViewModel;
@end

@implementation JobListWithDropDownListVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"地图显示" style:UIBarButtonItemStylePlain target:self action:@selector(showInMap)];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
    
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.tableList=[[JobListTableViewController alloc]init];
    [self addChildViewController:self.tableList];
    self.dropListViewModel=[[DropDownListViewModel alloc]init];
    DropDownListView *dropDownView = [[DropDownListView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width, 40) dataSource:self.dropListViewModel delegate:self.dropListViewModel];
    dropDownView.mSuperView = self.view;
    [self.view addSubview:dropDownView];
    
    self.tableList.view.frame=CGRectMake(0, 40,self.tableList.view.frame.size.width,self.view.frame.size.height-40);
    [self.view addSubview:self.tableList.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showInMap
{
    MapViewController *mapVC=[[MapViewController alloc]init];
    mapVC.hidesBottomBarWhenPushed=YES;
    //传入数据
    
    [mapVC setDataArray:[self.tableList getViewModelResultsList]];
    
    [self.navigationController pushViewController:mapVC animated:YES];
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
