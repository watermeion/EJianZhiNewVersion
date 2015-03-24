//
//  CheckInViewController.m
//  com_EJianZhi
//
//  Created by Mac on 2/1/15.
//  Copyright (c) 2015 Studio Of Spicy Hot. All rights reserved.
//

#import "CheckInViewController.h"
#import "SRScanVC.h"
#import "commonMacro.h"
@interface CheckInViewController ()<finishScaning>

@end

@implementation CheckInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self scanButtonInit];

}

-(void)scanButtonInit
{
//    [scanButton.layer setMasksToBounds:YES];
//    [scanButton.layer setCornerRadius:77.5];
    
    [self.scanBtn addTarget:self action:@selector(buttonDownScan:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)buttonDownScan:(id)sender
{
        [self setupCamera];
}


-(void)setupCamera
{
    if(IOS7)
    {
        SRScanVC * scanVC = [[SRScanVC alloc]init];
        scanVC.scanDelegate=self;
        [self presentViewController:scanVC animated:YES completion:^{
            
        }];
    }
    
}

- (void)finishScaning:(NSString *)QRCode{
//    customerObjectID=QRCode;
//    [self checkUpIfUserExist];
    
    NSLog(@"二维码扫描结果:%@",QRCode);
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

- (IBAction)showUncheckedAction:(id)sender {
}

- (IBAction)showCheckedAction:(id)sender {
}
- (IBAction)scanAction:(id)sender {
}
@end
