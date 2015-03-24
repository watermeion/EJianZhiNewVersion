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
@implementation MLJobDetailViewModel


- (instancetype)init
{
    self=[super init];
    if (self==nil) return nil;
//    //监听兼职变化,有变化更新ViewModel
    @weakify(self)
    [RACObserve(self, jianZhi) subscribeNext:^(id x) {
        @strongify(self)
        [self mappingJianZhiModel:self.jianZhi];
    }];
    return self;
}


- (instancetype)initWithData:(JianZhi *) data
{
    self=[super init];
    if (self==nil) return nil;
    self.jianZhi=data;
    return self;
}

- (NSString*)setQiYeName:(NSString*)name
{
    return [NSString stringWithFormat:@"发布企业:%@",name];
}


- (NSString *)setEvaluationTextWithResumeNum:(NSNumber *)jianliNum
                                 ReceiveRate:(NSNumber *)rRate
                            SatisfactionRate:(NSNumber *)sRate
{
    return [NSString stringWithFormat:@"简历接收率%@%，满意度%@%，共服务%@个同学",[rRate stringValue],[sRate stringValue],[jianliNum stringValue]];

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
    self.jobXiangQing=data.jianZhiContent;
    self.jobTeShuYaoQiu=data.jianzhiTeShuYaoQiu;
    self.jobQiYeName=[self setQiYeName:data.jianZhiQiYeName];
    self.jobAddress=data.jianZhiAddress;
//    self.jobEvaluation=self setEvaluationTextWithResumeNum:data.j ReceiveRate:<#(NSNumber *)#> SatisfactionRate:<#(NSNumber *)#>
    self.worktime=[self formatWorkTimeToArray:data.jianZhiWorkTime];
    self.jobPhone=data.jianZhiContactPhone;
    self.jobContactName=data.jianZhiContactName;
//    self.jobCommentsText=self setCommentTextWithNum:data.ji
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

@end
