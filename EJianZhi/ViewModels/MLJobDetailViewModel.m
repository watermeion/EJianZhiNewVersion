//
//  MLJobDetailViewModel.m
//  EJianZhi
//
//  Created by Mac on 3/23/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import "MLJobDetailViewModel.h"
#import "MBProgressHUD+Add.h"
#import "MBProgressHUD.h"
#import "MLMapManager.h"
@interface MLJobDetailViewModel()
@property (weak,nonatomic) MLMapManager *mapManager;
@end

@implementation MLJobDetailViewModel


- (MLMapManager*)mapManager
{
    if (_mapManager==nil) {
        _mapManager=[MLMapManager shareInstance];
    }
    return _mapManager;
}



- (instancetype)init
{
    self=[super init];
    if (self==nil) return nil;
//    //监听兼职变化,有变化更新ViewModel
    [self initRACFunction];
    return self;
}


/**
 *  初始化类内监听设置
 */
- (void)initRACFunction
{
    //    //监听兼职变化,有变化更新ViewModel
    @weakify(self)
    [RACObserve(self, jianZhi) subscribeNext:^(id x) {
        @strongify(self)
        if (x!=nil &&[x isKindOfClass:[JianZhi class]]) {
            [self mappingJianZhiModel:x];
        }
    }];
}

/**
 *  初始化实例
 *
 *  @param data <#data description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithData:(JianZhi *) data
{
    self=[super init];
    if (self==nil) return nil;
    self.jianZhi=data;
    [self initRACFunction];
    return self;
}

- (NSString*)setQiYeName:(NSString*)name
{
    return [NSString stringWithFormat:@"发布企业:%@",name];
}


- (NSString *)setEvaluationTextWithResumeNum:(NSNumber *)jianliNum
                                 ReceiveNum:(NSNumber *)rRate
                            SatisfactionRate:(NSNumber *)sRate
{
    return [NSString stringWithFormat:@"收到简历%@份，满意度%@%%，共服务%@个同学",[jianliNum stringValue],[sRate stringValue],[rRate stringValue]];

}


- (NSString *)setCommentTextWithNum:(NSNumber *)commentsNum
{
    return [NSString stringWithFormat:@"共有来自宇宙的%@个同学吐槽",[commentsNum stringValue]];
}

/**
 *  将JianZhi Model转换为ViewModel 显示的内容
 *
 *  @param data data isClass JianZhi
 */
-(void)mappingJianZhiModel:(JianZhi *)data
{
//
    self.jobTitle=data.jianZhiTitle;
    self.jobWages=[data.jianZhiWage stringValue];
    self.jobWagesType=[NSString stringWithFormat:@"/%@",data.jianZhiWageType];
    self.jobXiangQing=[data.jianZhiContent stringByAppendingString:[NSString  stringWithFormat:@"\n \n %@",data.jianZhiRequirement]];
    self.jobTeShuYaoQiu=data.jianzhiTeShuYaoQiu;
    self.jobQiYeName=[self setQiYeName:data.jianZhiQiYeName];
    self.jobAddress=data.jianZhiAddress;
    self.jobEvaluation=[self setEvaluationTextWithResumeNum:data.jianZhiQiYeResumeValue ReceiveNum:data.jianZhiQiYeLuYongValue SatisfactionRate:data.jianZhiQiYeManYiDu];
    self.worktime=[self formatWorkTimeToArray:data.jianZhiWorkTime];
    self.jobPhone=data.jianZhiContactPhone;
    self.jobContactName=data.jianZhiContactName;
    self.jobRequiredNum=[NSString stringWithFormat:@"%d",([data.jianZhiRecruitment intValue]-[data.jianZhiQiYeLuYongValue intValue])];
#warning 需要请求评论数据
    self.jobCommentsText=[self setCommentTextWithNum:nil];
    CLLocationCoordinate2D destination=CLLocationCoordinate2DMake(data.jianZhiPoint.latitude, data.jianZhiPoint.longitude);
    [self.mapManager findRouteByCarFrom:CLLocationCoordinate2DMake(39.54,116.1) To:destination];
}


/**
 *  解析workTime
 *
 *  @param workTime workTime description
 *
 *  @return return value description
 */
- (NSArray *)formatWorkTimeToArray:(NSString *)workTime
{
//    bool array[21];
    NSArray *workTimeArray = [workTime componentsSeparatedByString:@","];
//    for (int i = 0; i < [workTimeArray count]; i++) {
//        NSLog(@"string:%@", [workTimeArray objectAtIndex:i]);
//        int num=[[workTimeArray objectAtIndex:i]integerValue];
//        if (num>0 && num <21) worktime[num]=true;
//    }
    return workTimeArray;
}


#warning 添加地图请求

#warning 完善显示信息

#warning 提交浏览次数
@end
