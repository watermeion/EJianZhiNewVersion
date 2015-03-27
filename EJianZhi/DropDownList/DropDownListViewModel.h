//
//  DropDownListViewModel.h
//  EJianZhi
//
//  Created by Mac on 3/27/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DropDownChooseProtocol.h"
#import "DropDownListView.h"

/**
 *  完成dropDownList的datasource 和 delegate 工作
 */

@interface DropDownListViewModel : NSObject<DropDownChooseDataSource,DropDownChooseDelegate>

@property NSInteger section;
@property NSInteger row;
@property NSInteger index;


@end
