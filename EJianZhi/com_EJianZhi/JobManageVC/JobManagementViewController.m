//
//  JobManagementViewController.m
//  com_EJianZhi
//
//  Created by Mac on 2/1/15.
//  Copyright (c) 2015 Studio Of Spicy Hot. All rights reserved.
//

#import "JobManagementViewController.h"
#import "resumeBrowserTableViewCell.h"
#import  "commonMacro.h"
#import "titleJobSearchTableViewCell.h"


@interface JobManagementViewController ()<UITableViewDelegate,UITableViewDataSource>

    {
        NSInteger cellNum;
        NSDictionary *dataDictForSegement;
    }
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong,nonatomic)UILabel *titleLabel;

@property (strong,nonatomic)UISegmentedControl *segementedControl;
@end

@implementation JobManagementViewController

static NSString *Cellidentifier=@"resumeBrowserTableViewCell";
static NSString *Cellidentifier2=@"titleJobSearchTableViewCell";



-(UILabel*)titleLabel
{
    if (_titleLabel==nil) {
        _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0,MainScreenWidth, 30)];
    }
    return _titleLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self tableViewInit];
    [self segementedControlInit];
    [self rightBarItemsInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)segementedControlInit
{
    self.segementedControl=[[UISegmentedControl alloc]initWithItems:@[@"未处理",@"已录用"]];
    self.segementedControl.selectedSegmentIndex=0;
    self.navigationItem.titleView=self.segementedControl;
    [self.segementedControl addTarget:self
                           action:@selector(segementedChange)
                 forControlEvents:UIControlEventValueChanged];
}


-(void)segementedChange
{
    switch (self.segementedControl.selectedSegmentIndex) {
        case 0:
            NSLog(@"selected:%d",0);
            break;
        case 1:
            NSLog(@"selected:%d",1);
            break;
            
            
        default:
            break;
    }
   
}

-(void)tableViewInit
{
    cellNum=10;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    [self registerTableViewNib];
}


-(void)registerTableViewNib
{
    UINib *nib = [UINib nibWithNibName:@"resumeBrowserTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:Cellidentifier];
    
    UINib *nib2 = [UINib nibWithNibName:@"titleJobSearchTableViewCell" bundle:nil];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:Cellidentifier2];

}

-(void)rightBarItemsInit
{
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"添加兼职" style:UIBarButtonItemStylePlain target:self action:@selector(addNewJobAction)];
}

-(void)addNewJobAction
{
    
    
    
    
}


#pragma --mark  tableView  Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellNum;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//改变行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([indexPath row]==0) {
        titleJobSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cellidentifier2 forIndexPath:indexPath];
        return cell;
    }
    else{
    resumeBrowserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cellidentifier forIndexPath:indexPath];
        return cell;
    }
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row]==0) {
        
    }else
    {
    
    
    }
    
    
}

- (void)deselect
{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}


// Setting Header
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 80;
//}

//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 80)];
//
//     self.titleLabel.text=@"筛选条件";
//     UILabel *resultsLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, headerView.bounds.size.width, 30)];
//    [headerView addSubview:self.titleLabel];
//    
////    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
////    if (section == integerRepresentingYourSectionOfInterest)
////        [headerView setBackgroundColor:[UIColor redColor]];
////    else
////        [headerView setBackgroundColor:[UIColor clearColor]];
//    return headerView;
//}

//设置编辑属性
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;

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
