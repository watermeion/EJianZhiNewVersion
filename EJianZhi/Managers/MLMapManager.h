//
//  MLMapManager.h
//  EJianZhi
//
//  Created by Mac on 3/24/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
/**
 *  管理app中对AMap 使用，控制mapKey验证，持有MapView等
 */
@interface MLMapManager : NSObject

+(instancetype)shareInstance;

-(void)checkMapKey;


/**
 *  驾驶路径规划
 *
 *  @param originPoint      <#originPoint description#>
 *  @param destinationPoint <#destinationPoint description#>
 */
- (void)findRouteByCarFrom:(CLLocationCoordinate2D) originPoint
                        To:(CLLocationCoordinate2D) destinationPoint;

/**
 *  步行路径规划
 *
 *  @param originPoint      <#originPoint description#>
 *  @param destinationPoint <#destinationPoint description#>
 */
- (void)findRouteOnFootFrom:(CLLocationCoordinate2D) originPoint
                         To:(CLLocationCoordinate2D) destinationPoint;

/**
 *  公交路径规划
 *
 *  @param originPoint      <#originPoint description#>
 *  @param destinationPoint <#destinationPoint description#>
 */
- (void)findRouteByBusFrom:(CLLocationCoordinate2D) originPoint
                        To:(CLLocationCoordinate2D) destinationPoint;
@end
