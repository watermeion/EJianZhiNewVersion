//
//  MainPageViewController.m
//  com_EJianZhi
//
//  Created by Mac on 2/1/15.
//  Copyright (c) 2015 Studio Of Spicy Hot. All rights reserved.
//

#import "MainPageViewController.h"
#import "JobListForComTableViewCell.h"
#import "commonMacro.h"
#import "SearchViewController.h"

@interface MainPageViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
{
    NSInteger cellNum;

}


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)UISearchBar *searchBar;
@property (strong,nonatomic)UISearchDisplayController *mySearchDisplayVC;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self tableViewInit];
    
    //search Bar 可以用图标代替
    [self searchBarInit];
    [self rightBarItemsInit];
}


-(void)tableViewInit
{
    cellNum=10;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
}


-(void)searchBarInit
{
    
    self.searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, MainScreenWidth/2, 40)];
    self.searchBar.delegate=self;
    
   
    
    
    self.mySearchDisplayVC=[[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    
    self.mySearchDisplayVC.delegate=self;
    self.mySearchDisplayVC.searchResultsDelegate=self;
    self.mySearchDisplayVC.searchResultsDataSource=self;
    
    self.navigationItem.titleView=self.searchBar;
}


-(void)rightBarItemsInit
{
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"添加兼职" style:UIBarButtonItemStylePlain target:self action:@selector(addNewJobAction)];
}

-(void)addNewJobAction
{
    //test searchbar
    SearchViewController *search=[[SearchViewController alloc]init];
    [self.navigationController pushViewController:search animated:YES];

}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    BOOL nibsRegistered = NO;
    static NSString *Cellidentifier=@"JobListForComTableViewCell";
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"JobListForComTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:Cellidentifier];
    }
    
    JobListForComTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cellidentifier forIndexPath:indexPath];
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

- (void)deselect
{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}




@end
