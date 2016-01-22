//
//  CZSettingController.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZSettingController.h"
#import "CZGroup.h"
#import "CZItem.h"
#import "CZItemArrow.h"
#import "CZItemSwitch.h"
#import "CZSettingCell.h"
#import "CZPushRemindController.h"
#import "CZTestController.h"
#import "CZHelpController.h"
#import "CZProductController.h"
@interface CZSettingController ()

@end

@implementation CZSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化相应的数据
    // 1. 创建组
    CZGroup *group0 = [[CZGroup alloc]init];
    
    // 1.1 创建item
    CZItem *item0 = [CZItemArrow itemWithIcon:@"RedeemCode" title:@"使用兑换码" target:[CZTestController class]];
    //    item0.type = CZItemAccessoryTypeArrow;
    group0.items = @[item0];
    
    
    CZGroup *group1 = [[CZGroup alloc]init];
    
    // 1.1 创建item
    
    CZItem *item1_0 = [CZItemArrow itemWithIcon:@"MorePush" title:@"推送提醒" target:[CZPushRemindController class]];
    //    item1_0.type = CZItemAccessoryTypeArrow;
    CZItem *item1_1 = [CZItemSwitch itemWithIcon:@"more_homeshake" title:@"摇一摇机选"];
    //    item1_1.type = CZItemAccessoryTypeSwitch;
    CZItem *item1_2 = [CZItemSwitch itemWithIcon:@"sound_Effect" title:@"声音效果"];
    //    item1_2.type = CZItemAccessoryTypeSwitch;
    CZItem *item1_3 = [CZItemSwitch itemWithIcon:@"More_LotteryRecommend" title:@"购彩小助手"];
    //    item1_3.type = CZItemAccessoryTypeSwitch;
    group1.items = @[item1_0, item1_1, item1_2, item1_3];
    
    
    
    CZGroup *group2 = [[CZGroup alloc]init];
    
    // 1.1 创建item
    CZItemArrow *item2_0 = [CZItemArrow itemWithIcon:@"MoreUpdate" title:@"检测新版本"];
    // 设置block
    [item2_0 setBlock:^{
        NSLog(@"检测新版本");
    }];
    
    CZItem *item2_1 = [CZItemArrow itemWithIcon:@"MoreHelp" title:@"帮助" target:[CZHelpController class]];
    
    CZItem *item2_2 = [CZItemArrow itemWithIcon:@"MoreShare" title:@"分享" target:[CZTestController class]];
    
    CZItem *item2_3 = [CZItemArrow itemWithIcon:@"MoreNetease" title:@"产品推荐" target:[CZProductController class]];
    
    CZItem *item2_4 = [CZItemArrow itemWithIcon:@"MoreAbout" title:@"关于我们" target:[CZTestController class]];
    
    group2.items = @[item2_0, item2_1, item2_2, item2_3, item2_4];
    
    // 把组模型添加到大数组里面
    [self.data addObject:group0];
    [self.data addObject:group1];
    [self.data addObject:group2];
    

    
}


@end
