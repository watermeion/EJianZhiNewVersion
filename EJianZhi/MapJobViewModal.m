//
//  MapJobViewModal.m
//  EJianZhi
//
//  Created by Mac on 3/28/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import "MapJobViewModal.h"

@implementation MapJobViewModal

-(instancetype)init
{
    if (self=[super init]) {
        return self;
    }
    return nil;
}


-(void)setHandleView:(MLMapView *)handleView
{
    if (handleView!=nil) {
        _handleView=handleView;
        //添加数据监听
        @weakify(self)
        [RACObserve(self, resultsList) subscribeNext:^(NSArray *x) {
            @strongify(self)
            if (x.count>0) {
                [self showTableListInMap:x];
            };
        }];
    }
}
/**
 *  完成列表中兼职的地图展示
 *
 *  @param datasource JianZhi Model Array
 */
-(void) showTableListInMap:(NSArray *)datasource
{
    if (self.handleView==nil) {
        return;
    }
    if (datasource.count==0) {
        return;
    }
    for (int i=0; i<datasource.count; i++)
    {
        JianZhi *job=[datasource objectAtIndex:i];
        if (job.jianZhiPoint==nil) {
            continue;
        }
        CLLocationCoordinate2D point= CLLocationCoordinate2DMake(job.jianZhiPoint.latitude, job.jianZhiPoint.longitude);
        NSString *titleString=job.jianZhiTitle;
        NSString *subtitle=[NSString stringWithFormat:@"%@元/%@",[job.jianZhiWage stringValue],job.jianZhiWageType];
        [self.handleView addAnnotation:point Title:titleString Subtitle:subtitle Index:i SetToCenter:NO];
    }
}

@end
