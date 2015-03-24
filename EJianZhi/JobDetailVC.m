//
//  JobDetailVC.m
//  EJianZhi
//
//  Created by RAY on 15/1/30.
//  Copyright (c) 2015年 麻辣工作室. All rights reserved.
//
#define CollectionViewMiniLineSpace 3.0f
#define CollectionViewMiniInterItemsSpace 3.0f
#define CollectionViewItemsWidth ((MainScreenWidth-(7*CollectionViewMiniInterItemsSpace))/7)
#import "JobDetailVC.h"
#import "freeselectViewCell.h"

#import "ASDepthModalViewController.h"
#import "MLJobDetailViewModel.h"
static NSString *selectFreecellIdentifier = @"freeselectViewCell";


@interface JobDetailVC ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSMutableArray  *addedPicArray;
    NSArray  *selectfreetimepicArray;
    NSArray  *selectfreetimetitleArray;
    CGFloat freecellwidth;
    bool selectFreeData[21];
}
@property (strong,nonatomic) MLJobDetailViewModel *viewModel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jobContentViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UICollectionView *selectfreeCollectionOutlet;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewConstraint;

//popUpView
@property (strong, nonatomic) IBOutlet UIView *popUpView;
- (IBAction)callAction:(id)sender;
- (IBAction)messageAction:(id)sender;
- (IBAction)closePopUpViewAction:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *popUpViewPhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *popUpViewNameLabel;

//绑定内容展示表现层

@property (weak, nonatomic) IBOutlet UILabel *jobDetailTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *jobDetailJobWageTypeImage;
@property (weak, nonatomic) IBOutlet UILabel *jobDetailJobWagesLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobDetailJobWageTypeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *jobDetailJobSubFlagImage;

@property (weak, nonatomic) IBOutlet UILabel *jobDetailJobRequiredNumLabel;

@property (weak, nonatomic) IBOutlet UIImageView *jobDetailJobFlagImage;
@property (weak, nonatomic) IBOutlet UILabel *jobDetailTeShuYaoQiuLabel;

@property (weak, nonatomic) IBOutlet UILabel *jobDetailAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobDetailAddressNaviLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobDetailJobQiYeLabel;
@property (weak, nonatomic) IBOutlet UIButton *jobDetailMoreJobBtn;
@property (weak, nonatomic) IBOutlet UILabel *jobDetailJobXiangQingLabel;


//另外获取的数据

@property (weak, nonatomic) IBOutlet UILabel *jobDetailJobEvaluationLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobDetailJobComments;
@property (weak, nonatomic) IBOutlet UILabel *jobDetailWarnningLabel;
@property (weak, nonatomic) IBOutlet UIButton *jobDetailModifyWorkTimeBtn;

@property (weak, nonatomic) IBOutlet UIButton *jobDetailComplainBtn;

@property (weak, nonatomic) IBOutlet UIButton *jobDetailAddFavioritesBtn;

@property (weak, nonatomic) IBOutlet UIButton *jobDetailApplyBtn;



@end

@implementation JobDetailVC


- (void)setViewModelJianZhi:(id)data
{
    if ([data isKindOfClass:[JianZhi class]]) {
        
        self.viewModel=[[MLJobDetailViewModel alloc]init];
        self.viewModel.jianZhi=data;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self timeCollectionViewInit];
    self.tabBarController.tabBar.hidden=YES;
    //init rightBarButton
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"联系" style:UIBarButtonItemStylePlain target:self action:@selector(makeContactAction)];
    
    if (self.viewModel==nil) {
        self.viewModel=[[MLJobDetailViewModel alloc]init];
    }
    //创建监听
    @weakify(self)
    [RACObserve(self.viewModel,worktime) subscribeNext:^(id x) {
        @strongify(self)
        NSArray *workTimeArray=self.viewModel.worktime;
            for (int i = 0; i < [workTimeArray count]; i++) {
                NSLog(@"string:%@", [workTimeArray objectAtIndex:i]);
                int num=[[workTimeArray objectAtIndex:i]integerValue];
                if (num>0 && num <21) selectFreeData[num]=true;
            }
        [self.selectfreeCollectionOutlet reloadData];
        
    }];
    
    RAC(self.jobDetailTitleLabel,text)=RACObserve(self.viewModel, jobTitle);
    RAC(self.jobDetailJobWagesLabel,text)=RACObserve(self.viewModel, jobWages);
    RAC(self.jobDetailJobWageTypeLabel,text)=RACObserve(self.viewModel, jobWagesType);
    RAC(self.jobDetailJobQiYeLabel,text)=RACObserve(self.viewModel, jobQiYeName);
    RAC(self.jobDetailAddressLabel,text)=RACObserve(self.viewModel, jobAddress);
    RAC(self.jobDetailAddressNaviLabel,text)=RACObserve(self.viewModel, jobAddressNavi);
    RAC(self.jobDetailJobEvaluationLabel,text)=RACObserve(self.viewModel, jobEvaluation);
    RAC(self.jobDetailJobXiangQingLabel,text)=RACObserve(self.viewModel,jobXiangQing);
    RAC(self.popUpViewNameLabel,text)=RACObserve(self.viewModel, jobContactName);
    RAC(self.popUpViewPhoneLabel,text)=RACObserve(self.viewModel, jobPhone);
    RAC(self.jobDetailJobComments,text)=RACObserve(self.viewModel, jobCommentsText);
#warning 色块变化监听
    
    
    
}

- (void)updateConstraintsforJobContentLabelWithString:(NSString*) str{
//    NSString *str=@"1.负责在本学校的推广。梅州转发官方微信或微博信息至少3条，以及配合e兼职线下的活动。\n2.定期反馈学校的情况，包括学校大型活动的安排（量力而行）以及用于的反馈意见和建议。\n3.定期反馈学校的情况，包括学校大型活动的安排（量力而行）以及用于的反馈意见和建议。";
    if (str==nil) return;
    self.jobDetailJobXiangQingLabel.text=str;
    CGRect rect =[self.jobDetailJobXiangQingLabel.text boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width-16, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}  context:nil];
    self.jobContentViewHeightConstraint.constant=rect.size.height;
    self.containerViewConstraint.constant=538+rect.size.height;
}

- (void)timeCollectionViewInit{
    selectfreetimepicArray = [[NSMutableArray alloc]init];
    selectfreetimetitleArray = [[NSMutableArray alloc]init];
    freecellwidth = CollectionViewItemsWidth;
    
    selectfreetimetitleArray = @[
                                 [UIImage imageNamed:@"d1"],
                                 [UIImage imageNamed:@"d2"],
                                 [UIImage imageNamed:@"d3"],
                                 [UIImage imageNamed:@"d4"],
                                 [UIImage imageNamed:@"d5"],
                                 [UIImage imageNamed:@"d6"],
                                 [UIImage imageNamed:@"d7"],
                                 ];
    
    selectfreetimepicArray = @[[UIImage imageNamed:@"no"],
                               [UIImage imageNamed:@"yes"],
                               [UIImage imageNamed:@"no"],
                               [UIImage imageNamed:@"yes"],
                               [UIImage imageNamed:@"no"],
                               [UIImage imageNamed:@"yes"]
                               ];
    
    for (int index = 0; index<21; index++) {
        selectFreeData[index] = FALSE;
    }
    self.selectfreeCollectionOutlet.delegate = self;
    self.selectfreeCollectionOutlet.dataSource = self;
    UINib *niblogin = [UINib nibWithNibName:selectFreecellIdentifier bundle:nil];
    [self.selectfreeCollectionOutlet registerNib:niblogin forCellWithReuseIdentifier:selectFreecellIdentifier];
}

#pragma mark - Collection View Data Source
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 28;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(freecellwidth, freecellwidth);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row>=0 && indexPath.row<7) {
        return NO;
    }
    return YES;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    selectFreeData[indexPath.row-7] = selectFreeData[indexPath.row-7]?false:true;
    [collectionView reloadData];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    freeselectViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:selectFreecellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[freeselectViewCell alloc]init];
    }
    //[[cell imageView]setFrame:CGRectMake(0, 0, freecellwidth, freecellwidth)];
    if (indexPath.row>=0 && indexPath.row<7) {
        cell.imageView.image = [selectfreetimetitleArray objectAtIndex:indexPath.row];
    }
    
    
    if (indexPath.row>=7 && indexPath.row<14) {
        if (selectFreeData[indexPath.row-7]) {
            cell.imageView.image = [selectfreetimepicArray objectAtIndex:1];
        }else{
            cell.imageView.image = [selectfreetimepicArray objectAtIndex:0];
        }
        
    }
    if (indexPath.row>=14 && indexPath.row<21) {
        if (selectFreeData[indexPath.row-7]) {
            cell.imageView.image = [selectfreetimepicArray objectAtIndex:3];
        }else{
            cell.imageView.image = [selectfreetimepicArray objectAtIndex:2];
        }
    }
    if (indexPath.row>=21 && indexPath.row<28) {
        if (selectFreeData[indexPath.row-7]) {
            cell.imageView.image = [selectfreetimepicArray objectAtIndex:5];
        }else{
            cell.imageView.image = [selectfreetimepicArray objectAtIndex:4];
        }
    }
    return cell;
};


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    return CollectionViewMiniLineSpace;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
{
    return CollectionViewMiniInterItemsSpace;
    
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

-(void)makeContactAction
{
  //添加联系
    self.popUpView.layer.cornerRadius=2;
    self.popUpView.frame=CGRectMake(0, 0, 300, 280);
//    self.popUpView.layer.shadowOpacity=0.7;
//    self.popUpView.layer.shadowOffset=CGSizeMake(6, 6);
//    self.popUpView.layer.shouldRasterize = YES;
//    self.popUpView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    UIColor *bgcolor=nil;
    ASDepthModalAnimationStyle style = ASDepthModalAnimationDefault;
    [ASDepthModalViewController presentView:self.popUpView withBackgroundColor:bgcolor popupAnimationStyle:style];

}

- (IBAction)callAction:(id)sender {
    //打电话
    UIWebView*callWebview =[[UIWebView alloc] init];
    
    NSString *telUrl = [NSString stringWithFormat:@"tel://%@",self.popUpViewPhoneLabel.text];
    
    NSURL *telURL =[NSURL URLWithString:telUrl];// 貌似tel:// 或者 tel: 都行
    
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    
    //记得添加到view上
    
    [self.view addSubview:callWebview];
}

- (IBAction)messageAction:(id)sender {
   //发短信
    UIWebView*callWebview =[[UIWebView alloc] init];
    
    NSString *telUrl = [NSString stringWithFormat:@"sms://%@",self.popUpViewPhoneLabel.text];
    
    NSURL *telURL =[NSURL URLWithString:telUrl];// 貌似tel:// 或者 tel: 都行
    
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    
    //记得添加到view上
    
    [self.view addSubview:callWebview];
}

- (IBAction)closePopUpViewAction:(id)sender {
    [ASDepthModalViewController dismiss];
    
    
}




@end
