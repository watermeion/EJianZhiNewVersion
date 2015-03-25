//
//  MLLocationManager.h
//  EJianZhi
//
//  Created by Mac on 3/24/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//
/**
 *  管理App中所有位置请求的逻辑
 */
#import <Foundation/Foundation.h>

@interface MLLocationManager : NSObject

/**
 *  保存用户当前位置
 */
@property (nonatomic) CLLocationCoordinate2D currentUserLocation;

/**
 *  单例
 *
 *  @return <#return value description#>
 */
+(instancetype)shareInstance;


+(void)startLocating;

@end
