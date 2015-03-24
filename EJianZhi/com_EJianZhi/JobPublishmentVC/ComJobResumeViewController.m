//
//  ComJobResumeViewController.m
//  com_EJianZhi
//
//  Created by Mac on 2/1/15.
//  Copyright (c) 2015 Studio Of Spicy Hot. All rights reserved.
//

#import "ComJobResumeViewController.h"
#import "DVSwitch.h"
#import "freeselectViewCell.h"
#import "DropDownListView.h"
#import "commonMacro.h"


#define  PIC_WIDTH 64
#define  PIC_HEIGHT 64
#define  INSETS 10


#define NaviBarHeight  44
#define statusBarHeight 20


#define CollectionViewMiniLineSpace 3.0f
#define CollectionViewMiniInterItemsSpace 3.0f
#define CollectionViewItemsWidth ((MainScreenWidth-(7*CollectionViewMiniInterItemsSpace))/8)

static NSString *selectFreecellIdentifier = @"freeselectViewCell";

@interface ComJobResumeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSMutableArray  *addedPicArray;
    NSArray  *selectfreetimepicArray;
    NSArray  *selectfreetimetitleArray;
    CGFloat freecellwidth;
    bool selectFreeData[21];
    bool selectAllData[3];
    BOOL selectAll;
    DVSwitch *switcher;
}
@property (weak, nonatomic) IBOutlet UICollectionView *selectFreeCollectionOutlet;
@end

@implementation ComJobResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self picScrollViewInit];
      self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"网页填写" style:UIBarButtonItemStylePlain target:self action:@selector(addOnLineAction)];
    
//    self.tabBarController.tabBar.hidden=YES;
    [self switcherInit];
    [self timeCollectionViewInit];
    
    
    //page1
    [self.view1 setFrame:CGRectMake(0, 0, MainScreenWidth,MainScreenHeight-168)];
    [self.mainScrollView addSubview:self.view1];
    
    
    //page2
    [self.view2 setFrame:CGRectMake(MainScreenWidth, 0, MainScreenWidth, MainScreenHeight-168)];
    [self.mainScrollView addSubview:self.view2];
    
    //page3
    [self.view3 setFrame:CGRectMake(MainScreenWidth*2, 0, MainScreenWidth, MainScreenHeight-168)];
    [self.mainScrollView addSubview:self.view3];
}



- (void)timeCollectionViewInit{
    selectfreetimepicArray = [[NSMutableArray alloc]init];
    selectfreetimetitleArray = [[NSMutableArray alloc]init];
    freecellwidth = CollectionViewItemsWidth;
    selectfreetimetitleArray = @[[UIImage imageNamed:@"prompt"],
                                 [UIImage imageNamed:@"resume_1"],
                                 [UIImage imageNamed:@"resume_2"],
                                 [UIImage imageNamed:@"resume_3"],
                                 [UIImage imageNamed:@"resume_4"],
                                 [UIImage imageNamed:@"resume_5"],
                                 [UIImage imageNamed:@"resume_6"],
                                 [UIImage imageNamed:@"resume_7"],
                                 ];
    selectfreetimepicArray = @[[UIImage imageNamed:@"resume_am1"],
                               [UIImage imageNamed:@"resume_am2"],
                               [UIImage imageNamed:@"resume_pm1"],
                               [UIImage imageNamed:@"resume_pm2"],
                               [UIImage imageNamed:@"resume_night1"],
                               [UIImage imageNamed:@"resume_night2"]
                               ];
    
    //初始化选择数组
    selectAll=FALSE;
    for (int index = 0; index<24; index++) {
        selectFreeData[index] = FALSE;
    }
    for (int i=0; i<3; i++) {
        selectAllData[i]=FALSE;
    }
    self.selectFreeCollectionOutlet.delegate = self;
    self.selectFreeCollectionOutlet.dataSource = self;
    UINib *niblogin = [UINib nibWithNibName:selectFreecellIdentifier bundle:nil];
    [self.selectFreeCollectionOutlet registerNib:niblogin forCellWithReuseIdentifier:selectFreecellIdentifier];
}






- (void)refreshScrollView
{
    CGFloat width=(PIC_WIDTH+INSETS*2)+(addedPicArray.count-1)*(PIC_WIDTH+INSETS);
    CGSize contentSize=CGSizeMake(width, 0);
    [self.picScrollView setContentSize:contentSize];
    [self.picScrollView setContentOffset:CGPointMake(width<self.picScrollView.frame.size.width?0:width-self.picScrollView.frame.size.width, 0) animated:YES];
}

- (void)switcherInit{
    switcher = [DVSwitch switchWithStringsArray:@[@"填写联系信息", @"填写兼职信息", @"发布"]];
    switcher.frame = CGRectMake(0,40,MainScreenWidth, 44);
    switcher.backgroundColor = [UIColor whiteColor];
    switcher.sliderColor = [UIColor colorWithRed:41.0/255.0 green:169.0/255.0 blue:220.0/255.0 alpha:1.0];
    switcher.labelTextColorInsideSlider = [UIColor whiteColor];
    switcher.labelTextColorOutsideSlider = [UIColor blackColor];
    switcher.cornerRadius = 0;
    __weak ComJobResumeViewController* weakSelf=self;
    [switcher setWillBePressedHandler:^(NSUInteger index) {
        if (index==0)
            [weakSelf.mainScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        else if (index==1)
            [weakSelf.mainScrollView setContentOffset:CGPointMake([[UIScreen mainScreen] bounds].size.width, 0) animated:YES];
        else if (index==2)
            [weakSelf.mainScrollView setContentOffset:CGPointMake([[UIScreen mainScreen] bounds].size.width*2, 0) animated:YES];
    }];
    
    [self.view addSubview:switcher];
    
}

//图片滑动view
//- (void)picScrollViewInit{
//    addedPicArray=[[NSMutableArray alloc]init];
//    UIButton *btnPic=[[UIButton alloc]initWithFrame:CGRectMake(INSETS, 0, PIC_WIDTH, PIC_HEIGHT)];
//    [btnPic setImage:[UIImage imageNamed:@"resume_add"] forState:UIControlStateNormal];
//    [addedPicArray addObject:btnPic];
//    [self.picScrollView addSubview:btnPic];
//    [btnPic addTarget:self action:@selector(addPicAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self refreshScrollView];
//}

//- (IBAction)addPicAction:(UIButton *)sender {
//    
//    //添加图片
//    UIButton *btnPic=[[UIButton alloc]initWithFrame:CGRectMake(-PIC_WIDTH, 0, PIC_WIDTH, PIC_HEIGHT)];
//    [btnPic setImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];
//    [btnPic setFrame:CGRectMake(-PIC_WIDTH, 0, PIC_WIDTH, PIC_HEIGHT)];
//    [addedPicArray addObject:btnPic];
//    [btnPic setRestorationIdentifier:[NSString stringWithFormat:@"%lu",(unsigned long)addedPicArray.count-1]];
//    [btnPic addTarget:self action:@selector(deletePicAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self.picScrollView addSubview:btnPic];
//    
//    for (UIButton *btn in addedPicArray) {
//        CABasicAnimation *positionAnim=[CABasicAnimation animationWithKeyPath:@"position"];
//        [positionAnim setFromValue:[NSValue valueWithCGPoint:CGPointMake(btn.center.x, btn.center.y)]];
//        [positionAnim setToValue:[NSValue valueWithCGPoint:CGPointMake(btn.center.x+INSETS+PIC_WIDTH, btn.center.y)]];
//        [positionAnim setDelegate:self];
//        [positionAnim setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//        [positionAnim setDuration:0.25f];
//        [btn.layer addAnimation:positionAnim forKey:nil];
//        
//        [btn setCenter:CGPointMake(btn.center.x+INSETS+PIC_WIDTH, btn.center.y)];
//    }
//    [self refreshScrollView];
//}
//
//-(IBAction)deletePicAction:(UIButton *)sender{
//    NSInteger btnindex = [sender restorationIdentifier].integerValue;
//    UIButton *btn = [addedPicArray objectAtIndex:btnindex];
//    [btn removeFromSuperview];
//    for (UIButton *tempbtn in addedPicArray) {
//        if ([tempbtn restorationIdentifier].intValue > btnindex) {
//            [tempbtn setRestorationIdentifier:[NSString stringWithFormat:@"%d",[tempbtn restorationIdentifier].intValue-1]];
//            continue;
//        }
//        if ([tempbtn restorationIdentifier].intValue == btnindex) {
//            continue;
//        }
//        if ([tempbtn restorationIdentifier].intValue < btnindex) {
//            CABasicAnimation *positionAnim=[CABasicAnimation animationWithKeyPath:@"position"];
//            [positionAnim setFromValue:[NSValue valueWithCGPoint:CGPointMake(tempbtn.center.x, tempbtn.center.y)]];
//            [positionAnim setToValue:[NSValue valueWithCGPoint:CGPointMake(tempbtn.center.x-INSETS-PIC_WIDTH, tempbtn.center.y)]];
//            [positionAnim setDelegate:self];
//            [positionAnim setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//            [positionAnim setDuration:0.25f];
//            [tempbtn.layer addAnimation:positionAnim forKey:nil];
//            [tempbtn setCenter:CGPointMake(tempbtn.center.x-INSETS-PIC_WIDTH, tempbtn.center.y)];
//        }
//    }
//    [addedPicArray removeObjectAtIndex:btnindex];
//    [self refreshScrollView];
//}



//page1
#pragma mark - Collection View Data Source
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 32;
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
    if (indexPath.row>=1 && indexPath.row<8) {
        return NO;
    }
    return YES;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected row:%ld",(long)indexPath.row);
    
    if (indexPath.row==0) {
//        selectAllData[0]=selectAllData[0]?false:true;
        //全选
        selectAll=selectAll?false:true;
        if (selectAll) {
            for (int j=0; j<21; j++) {
                selectFreeData[j]=true;
            }
            for (int i=0; i<3; i++) {
                selectAllData[i]=true;
            }
        }else
        {
            for (int j=0; j<21; j++) {
                selectFreeData[j]=FALSE;
            }
            for (int i=0; i<3; i++) {
                selectAllData[i]=FALSE;
            }
        
        }
        
    }
    //单选一行
    else if(indexPath.row==8)
    {
       selectAllData[0]=selectAllData[0]?false:true;
        if (selectAllData[0]) {
            for (int j=0; j<7; j++) {
                selectFreeData[j]=TRUE;
            }
        }
        else
        {
            for (int j=0; j<7; j++) {
                selectFreeData[j]=FALSE;
            }
        
        }
        
    
    }
    else if(indexPath.row==16)
    {
         selectAllData[1]=selectAllData[1]?false:true;
        if (selectAllData[1]) {
            for (int j=7; j<14; j++) {
                selectFreeData[j]=TRUE;
            }
        }
        else
        {
            for (int j=7; j<14; j++) {
                selectFreeData[j]=FALSE;
            }
            
        }
    }
    else if(indexPath.row==24)
    {
         selectAllData[2]=selectAllData[2]?false:true;
        if (selectAllData[2]) {
            for (int j=14; j<21; j++) {
                selectFreeData[j]=TRUE;
            }
        }
        else
        {
            for (int j=14; j<21; j++) {
                selectFreeData[j]=FALSE;
            }
            
        }
    }
    else
    {
       if (indexPath.row<16) selectFreeData[indexPath.row-9] = selectFreeData[indexPath.row-9]?false:true;
        if (indexPath.row>16 && indexPath.row<24) selectFreeData[indexPath.row-10] = selectFreeData[indexPath.row-10]?false:true;
        if (indexPath.row>24 && indexPath.row<32) selectFreeData[indexPath.row-11] = selectFreeData[indexPath.row-11]?false:true;
    }
    
        [collectionView reloadData];
    
 
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    freeselectViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:selectFreecellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[freeselectViewCell alloc]init];
    }
    //[[cell imageView]setFrame:CGRectMake(0, 0, freecellwidth, freecellwidth)];

    
    if (indexPath.row>=0 && indexPath.row<8) {
        cell.imageView.image = [selectfreetimetitleArray objectAtIndex:indexPath.row];
    }
    
    if (indexPath.row==8 || indexPath.row==16 || indexPath.row==24 ) {
        cell.imageView.image=[UIImage imageNamed:@"prompt"];
    }
    //第二行
    if (indexPath.row>=9 && indexPath.row<16) {
       //如果该时段未全选
        if (selectAllData[0]) {
            cell.imageView.image = [selectfreetimepicArray objectAtIndex:1];
            //否则单选
            if(!selectFreeData[indexPath.row-9]) {
                cell.imageView.image = [selectfreetimepicArray objectAtIndex:0];
            }
        }
        else
        {
            if(selectFreeData[indexPath.row-9]) {
                cell.imageView.image = [selectfreetimepicArray objectAtIndex:1];
            }else{
            cell.imageView.image = [selectfreetimepicArray objectAtIndex:0];
            }
        }
    }
    //第三行
    if (indexPath.row>=17 && indexPath.row<24) {
        //如果该时段未全选
        if ( selectAllData[1]) {
             cell.imageView.image = [selectfreetimepicArray objectAtIndex:3];
            if (!selectFreeData[indexPath.row-10]) {
                cell.imageView.image = [selectfreetimepicArray objectAtIndex:2];
            }
           
        }else{
            if(selectFreeData[indexPath.row-10]) {
                cell.imageView.image = [selectfreetimepicArray objectAtIndex:3];
            }else{
                cell.imageView.image = [selectfreetimepicArray objectAtIndex:2];
            }
        }
    }
    //第四行
    if (indexPath.row>=25 && indexPath.row<32) {
        if (selectAllData[2]) {
            cell.imageView.image = [selectfreetimepicArray objectAtIndex:5];
            if(!selectFreeData[indexPath.row-11])
            {
              cell.imageView.image = [selectfreetimepicArray objectAtIndex:4];
            }
        }else{
            if(selectFreeData[indexPath.row-11])
            {
                cell.imageView.image = [selectfreetimepicArray objectAtIndex:3];
            }
            else cell.imageView.image = [selectfreetimepicArray objectAtIndex:4];
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



#pragma --mark  事件处理
-(void)addOnLineAction
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
