//
//  MLMapManager.h
//  EJianZhi
//
//  Created by Mac on 3/24/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapCommonObj.h>
/**
 *  管理app中对AMap 使用，控制mapKey验证，所有高德地图有关的操作都封装在这个类中等
 */
@class MLMapView;
@interface MLMapManager : NSObject

+(instancetype)shareInstance;

-(void)checkMapKey;

/**
 *  初始化新的MapView,
 *
 *  @param frame frame description
 *
 *  @return <#return value description#>
 */
- (MLMapView *)getMapViewInstanceInitWithFrame:(CGRect)frame;

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
