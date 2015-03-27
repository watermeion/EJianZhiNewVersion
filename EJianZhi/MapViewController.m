//
//  MapViewController.m
//  EJianZhi
//
//  Created by Mac on 3/27/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import "MapViewController.h"
#import "AJLocationManager.h"
@interface MapViewController ()

@property (strong,nonatomic)UISearchBar *searchBar;
@property (weak,nonatomic)AJLocationManager *locationManager;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.searchBar=[[UISearchBar alloc]init];
    self.navigationItem.titleView =self.searchBar;
    //监听searchBar text;
    self.locationManager=[AJLocationManager shareLocation];
    self.mapManager=[MLMapManager shareInstance];
    self.mapView=[self.mapManager getMapViewInstanceInitWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.mapView];
    [self.mapView setShowUserLocation:YES];
}

/**
 *  完成列表中兼职的地图展示
 */
-(void) showTableListInMap:(NSArray *)datasource
{
   

}

/**
 *  根据搜索内容，显示数据
 */
- (void)showSearchDateListInMap
{


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
