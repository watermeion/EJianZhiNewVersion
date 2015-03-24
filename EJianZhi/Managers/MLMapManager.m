//
//  MLMapManager.m
//  EJianZhi
//
//  Created by Mac on 3/24/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//
/**
 *  完成地图的所有操作，包括地理编码查询，地图显示，导航查询等
 */


#import "MLMapManager.h"
#import "MLMapView.h"
#import "MLLocationManager.h"
#import <AMapSearchAPI.h>
@interface MLMapManager()<AMapSearchDelegate>

//@property (strong,nonatomic) MLMapView *mapView;
@property (weak,nonatomic)MLLocationManager *locationManager;
@property (strong,nonatomic)AMapSearchAPI *searchAPI;
@end


@implementation MLMapManager

static MLMapManager * thisInstance;
static NSString *mapKey=@"75b8982e76c3c19b749f1fb7fd9ef67a";

+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thisInstance=[[super alloc]init];
        thisInstance.locationManager=[MLLocationManager shareInstance];
         //初始化检索对象
//        thisInstance.searchAPI = [[AMapSearchAPI alloc] initWithSearchKey:mapKey Delegate:thisInstance];
    });
    return thisInstance;
}


- (AMapSearchAPI *)searchAPI
{
    if (_searchAPI==nil) {
        //初始化检索对象
        _searchAPI=[[AMapSearchAPI alloc] initWithSearchKey:mapKey Delegate:self];
    }
    return _searchAPI;
}


-(void)checkMapKey
{
    [MAMapServices sharedServices].apiKey = mapKey;
}

/**
 *  初始化新的MapView,
 *
 *  @param frame frame description
 *
 *  @return <#return value description#>
 */
- (MLMapView *)getMapViewInstanceInitWithFrame:(CGRect)frame
{
    [self checkMapKey];
    return [[MLMapView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
}

/**
 *  公交路径规划
 *
 *  @param originPoint      <#originPoint description#>
 *  @param destinationPoint <#destinationPoint description#>
 */
- (void)findRouteByBusFrom:(CLLocationCoordinate2D) originPoint
                         To:(CLLocationCoordinate2D) destinationPoint
{
    [self setAMapNaviSearchParametersWithSearchType:AMapSearchType_NaviBus OriginPoint:originPoint DestinationPoint:destinationPoint];
}

/**
 *  步行路径规划
 *
 *  @param originPoint      <#originPoint description#>
 *  @param destinationPoint <#destinationPoint description#>
 */
- (void)findRouteOnFootFrom:(CLLocationCoordinate2D) originPoint
                        To:(CLLocationCoordinate2D) destinationPoint
{
    [self setAMapNaviSearchParametersWithSearchType:AMapSearchType_NaviWalking OriginPoint:originPoint DestinationPoint:destinationPoint];
}


/**
 *  驾驶路径规划
 *
 *  @param originPoint      <#originPoint description#>
 *  @param destinationPoint <#destinationPoint description#>
 */
- (void)findRouteByCarFrom:(CLLocationCoordinate2D) originPoint
                       To:(CLLocationCoordinate2D) destinationPoint
{
    [self setAMapNaviSearchParametersWithSearchType:AMapSearchType_NaviDrive OriginPoint:originPoint DestinationPoint:destinationPoint];
}



/**
 *  路径导航服务
 *
 *  @param type             AMapSearchType  步行 公交 驾车等
 *  @param originPoint      originPoint 起点坐标
 *  @param destinationPoint destinationPoint 终点坐标
 */
- (void)setAMapNaviSearchParametersWithSearchType:(AMapSearchType) type
                                      OriginPoint:(CLLocationCoordinate2D) originPoint
                                 DestinationPoint:(CLLocationCoordinate2D) destinationPoint
{
    //构造AMapNavigationSearchRequest对象，配置查询参数
    AMapNavigationSearchRequest *naviRequest= [[AMapNavigationSearchRequest alloc] init];
    naviRequest.searchType = type;
    naviRequest.requireExtension = YES;
    naviRequest.origin = [AMapGeoPoint locationWithLatitude:originPoint.latitude longitude:originPoint.longitude];
    naviRequest.destination = [AMapGeoPoint locationWithLatitude:destinationPoint.latitude longitude:destinationPoint.longitude];
    
    //发起路径搜索
    [self.searchAPI AMapNavigationSearch: naviRequest];

}




//实现路径搜索的回调函数
- (void)onNavigationSearchDone:(AMapNavigationSearchRequest *)request response:(AMapNavigationSearchResponse *)response
{
    if(response.route == nil)
    {
        return;
    }
    
    //通过AMapNavigationSearchResponse对象处理搜索结果
    NSString *route = [NSString stringWithFormat:@"Navi: %@", response.route];
    NSLog(@"%@", route);
}


/**
 *  路径规划结果解析
 */
- (NSString *)mappingResponseRoute:(AMapRoute*) route
{
    return nil;
};

/**
 *  计算距离导航、单位米
 *
 *  @param pointA pointA description
 *  @param pointB pointB description
 *
 *  @return NSNumber 单位米
 */
- (NSNumber *)calDistanceMeterWithPointA:(CLLocationCoordinate2D)pointA
                             PointB:(CLLocationCoordinate2D)pointB
{
    //1.将两个经纬度点转成投影点
    MAMapPoint point1 = MAMapPointForCoordinate(pointA);
    MAMapPoint point2 = MAMapPointForCoordinate(pointB);
    //2.计算距离
    CLLocationDistance distance = MAMetersBetweenMapPoints(point1,point2);
    return [NSNumber numberWithDouble:distance];
}





@end
