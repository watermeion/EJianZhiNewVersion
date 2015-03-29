//
//  MapJobViewModal.h
//  EJianZhi
//
//  Created by Mac on 3/28/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import "ViewModel.h"
#import "MLMapView.h"
#import "JianZhi.h"
#import "MLMapManager.h"
/**
 *  负责MapViewController 的逻辑任务
 */

@interface MapJobViewModal : ViewModel<showDetailDelegate>

@property (weak,nonatomic)MLMapView *handleView;

/**
 *  完成列表中兼职的地图展示
 *
 *  @param datasource JianZhi Model Array
 */
-(void) showTableListInMap:(NSArray *)datasource;

@end
