//
//  MapViewController.h
//  EJianZhi
//
//  Created by Mac on 3/27/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLMapView.h"
#import "MLMapManager.h"

/**
 *  展示地图界面，完成基于地图的一些操作等
 */
@interface MapViewController : UIViewController

@property (weak,nonatomic) MLMapManager *mapManager;

@property (strong,nonatomic)MLMapView *mapView;





@end
