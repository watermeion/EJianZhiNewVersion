//
//  MLLocationManager.m
//  EJianZhi
//
//  Created by Mac on 3/24/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import "MLLocationManager.h"

@implementation MLLocationManager


static MLLocationManager *thisInstance;
+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thisInstance=[[super alloc]init];
        //判断初始化是否是在GPS环境下，以及用户状态的
    });
    return thisInstance;
}





@end
