//
//  MLJobDetailViewModel.h
//  EJianZhi
//
//  Created by Mac on 3/23/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JianZhi.h"

//主要功能完成职位详情页面的数据
@interface MLJobDetailViewModel : NSObject
{
    bool worktime[21];
}
@property (strong,nonatomic) JianZhi *jianZhi;


/**
 *  初始化实例
 *
 *  @param data <#data description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithData:(JianZhi *) data;


//页面所需数据

@property (nonatomic,strong)NSString *jobTitle;
@property (nonatomic,strong)NSString *jobWages;
@property (nonatomic,strong)NSString *jobWagesType;
@property (nonatomic,strong)NSString *jobTeShuYaoQiu;
@property (nonatomic,strong)NSString *jobAddress;
@property (nonatomic,strong)NSString *jobAddressNavi;
@property (nonatomic,strong)NSString *jobQiYeName;
@property (nonatomic,strong)NSString *jobXiangQing;
@property (nonatomic,strong)NSString *jobEvaluation;
@property (nonatomic,strong)NSString *jobCommentsText;

@property (nonatomic,strong)NSString *warning;
@property (nonatomic,strong)NSString *jobRequiredNum;
@property (nonatomic,strong)NSArray *worktime;

@property (nonatomic,strong)NSString *jobPhone;
@property (nonatomic,strong)NSString *jobContactName;
//页面所需评价、评论数据请求

@property (nonatomic,strong)UIImage *typeImage;


@end
