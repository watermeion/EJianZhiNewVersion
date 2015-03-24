//
//  SearchViewController.m
//  com_EJianZhi
//
//  Created by Mac on 2/1/15.
//  Copyright (c) 2015 Studio Of Spicy Hot. All rights reserved.
//

#import "SearchViewController.h"
#import "commonMacro.h"
#import "JobListForComTableViewCell.h"
@interface SearchViewController ()<UISearchBarDelegate,UISearchDisplayDelegate>

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    self.navigationItem.titleView=self.searchBar;
}

-(void)configSearchBar
{


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISearchBar Delegate
//搜索框中的内容发生改变时 回调（即要搜索的内容改变）
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"changed");
    if (_searchBar.text.length == 0) {
        //        [self setSearchControllerHidden:YES]; //控制下拉列表的隐现
    }else{
        //        [self setSearchControllerHidden:NO];
        
    }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = YES;
    for(id cc in [searchBar subviews])
    {
        if([cc isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)cc;
            [btn setTitle:@"取消"  forState:UIControlStateNormal];
        }
    }
    NSLog(@"shuould begin");
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    searchBar.text = @"";
    NSLog(@"did begin");
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    NSLog(@"did end");
    searchBar.showsCancelButton = NO;
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"search clicked");
}

//点击搜索框上的 取消按钮时 调用
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"cancle clicked");
    _searchBar.text = @"";
    [_searchBar resignFirstResponder];
    //    [self setSearchControllerHidden:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
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
//    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
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
