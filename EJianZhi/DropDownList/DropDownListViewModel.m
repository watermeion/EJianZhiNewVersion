//
//  DropDownListViewModel.m
//  EJianZhi
//
//  Created by Mac on 3/27/15.
//  Copyright (c) 2015 &#40635;&#36771;&#24037;&#20316;&#23460;. All rights reserved.
//

#import "DropDownListViewModel.h"


@interface DropDownListViewModel()
@property NSMutableArray *chooseArray;
@end


@implementation DropDownListViewModel

-(instancetype)init
{
    if (self=[super init]) {
        
        [self initDropDownData];
        
        return self;
        
    }
    return nil;
}


- (BOOL)initDropDownData
{
    NSMutableArray *chooseArray1=[[NSMutableArray alloc]initWithObjects:
                                  [[NSDictionary alloc]initWithObjectsAndKeys:@"全部分类",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"今日新单",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"美食",@"type",@"1",@"detailExist",@[@"全部",@"火锅",@"自助餐",@"西餐",@"烧烤/烤串",@"麻辣烫",@"日韩料理",@"蛋糕甜点",@"麻辣香锅",@"川湘菜",@"江浙菜",@"粤菜",@"西北/东北菜",@"京菜/鲁菜",@"云贵菜",@"东南亚菜",@"台湾菜",@"海鲜",@"小吃快餐",@"特色菜",@"汤/粥/炖菜",@"咖啡/酒吧",@"新疆菜",@"聚餐宴请",@"其他美食",@"清真菜"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"电影",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"酒店",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"休闲娱乐",@"type",@"1",@"detailExist",@[@"全部",@"KTV",@"亲子游玩",@"温泉",@"洗浴",@"洗浴/汗蒸",@"足疗按摩",@"景点郊游",@"游泳/水上乐园",@"游乐园",@"运动健身",@"采摘",@"桌游/电玩",@"密室逃脱",@"咖啡酒吧",@"演出赛事",@"DIY手工",@"真人CS",@"4D/5D电影",@"其他娱乐"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"生活服务",@"type",@"1",@"detailExist",@[@"全部",@"婚纱摄影",@"儿童摄影",@"个性写真",@"母婴亲子",@"体检保健",@"汽车服务",@"逛街购物",@"照片冲印",@"培训课程",@"鲜花婚庆",@"服装定制洗护",@"配镜",@"商场购物卡",@"其他生活"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"丽人",@"type",@"1",@"detailExist",@[@"全部",@"美发",@"美甲",@"美容美体",@"瑜伽/舞蹈"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"旅游",@"type",@"1",@"detailExist",@[@"全部",@"景点门票",@"本地/周边游",@"国内游",@"境外游",@"漂流"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"购物",@"type",@"1",@"detailExist",@[@"全部",@"女装",@"男装",@"内衣",@"鞋靴",@"箱包/皮具",@"家具日用",@"家纺",@"食品",@"饰品/手表",@"美妆/个护",@"电器/数码",@"母婴/玩具",@"运动/户外",@"本地购物",@"其他购物"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"抽奖",@"type",@"0",@"detailExist",nil]
                                  , nil];
    
    NSMutableArray *chooseArray2=[[NSMutableArray alloc]initWithObjects:
                                  [[NSDictionary alloc]initWithObjectsAndKeys:@"全城",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"热门商区",@"type",@"1",@"detailExist",@[@"全部",@"滨江道",@"塘沽城区",@"大悦城",@"经济开发区",@"白堤路/风荷园",@"小海地",@"五大道",@"静海县",@"大港油田",@"大港城区",@"汉沽城区",@"河东万达广场",@"天津站后广场",@"乐园道",@"新港"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"滨海新区",@"type",@"1",@"detailExist",@[@"全部",@"塘沽城区",@"经济开发区",@"小海地",@"五大道",@"大港油田",@"大港城区",@"大港学府路",@"汉沽城区",@"新港"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"南开区",@"type",@"1",@"detailExist",@[@"全部",@"大悦城",@"白堤路/风荷园",@"王顶堤/华苑",@"水上/天塔",@"时代奥城",@"长虹公园",@"南开公园",@"海光寺/六里台",@"南开大学",@"天拖地区",@"鞍山西道",@"乐天",@"咸阳路/黄河道",@"天佑路/西南角"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"和平区",@"type",@"1",@"detailExist",@[@"全部",@"滨江道",@"和平路",@"小白楼",@"鞍山道沿线",@"南市",@"五大道",@"西康路沿线",@"荣业大街",@"卫津路沿线"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"红桥区",@"type",@"1",@"detailExist",@[@"全部",@"芥园路/复兴路",@"丁字沽",@"凯莱赛/西沽",@"水木天成",@"天津西站",@"大胡同",@"鹏欣水游城",@"邵公庄",@"本溪路",@"天津之眼"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"河西区",@"type",@"1",@"detailExist",@[@"全部",@"小海地",@"体院北",@"图书大厦",@"梅江",@"永安道",@"尖山",@"佟楼",@"宾西",@"挂甲寺",@"友谊路",@"越秀路",@"南楼",@"下瓦房",@"乐园道",@"新业广场"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"河东区",@"type",@"1",@"detailExist",@[@"全部",@"中山门",@"大直沽",@"大王庄",@"工业大学",@"万新村",@"卫国道",@"二宫",@"大桥道",@"河东万达广场",@"天津站后广场"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"河北区",@"type",@"1",@"detailExist",@[@"全部",@"王串场/民权门",@"中山路",@"意大利风情区",@"天泰路/榆关道",@"狮子林大街",@"金钟河大街"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"津南区",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"东丽区",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"西青区",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"武清区",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"近郊",@"type",@"1",@"detailExist",@[@"全部",@"北辰区",@"蓟县",@"静海县",@"宝坻区"],@"detail",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"宁河县",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"武清区",@"type",@"0",@"detailExist",nil]
                                  , nil];
    NSMutableArray *chooseArray3=[[NSMutableArray alloc]initWithObjects:
                                  [[NSDictionary alloc]initWithObjectsAndKeys:@"智能排序",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"离我最近",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"评价最高",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"最新发布",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"人气最高",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"价格最低",@"type",@"0",@"detailExist",nil]
                                  ,[[NSDictionary alloc]initWithObjectsAndKeys:@"价格最高",@"type",@"0",@"detailExist",nil]
                                  , nil];
    
    self.chooseArray=[NSMutableArray arrayWithObjects:chooseArray1,chooseArray2,chooseArray3, nil];
    return YES;
}


//-(NSInteger)numberOfSections
//{
//
//  
//
//}
//-(NSInteger)numberOfRowsOfPart1InSection:(NSInteger)section
//{
//
//
//}
//-(NSInteger)numberOfRowsOfPart2InSection:(NSInteger)section Row:(NSInteger)row
//{
//
//}
//
//
//-(NSString *)titleOfPart1InSection:(NSInteger)section index:(NSInteger) index
//{
//
//}
//
//
//-(NSString *)titleOfPart2InSection:(NSInteger)section index:(NSInteger) index row:(NSInteger)row
//{
//
//}
//-(NSInteger)defaultShowSection:(NSInteger)section
//{
//
//
//}

-(void) chooseAtSection:(NSInteger)section index:(NSInteger)index row:(NSInteger)row
{
    


}

@end
