//
//  CZPushRemindController.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZPushRemindController.h"
#import "CZGroup.h"
#import "CZItem.h"
#import "CZSettingCell.h"
#import "CZItemArrow.h"
#import "CZAwardAnimationController.h"
#import "CZBuyRemindController.h"
#import "CZCirclePushController.h"
#import "CZOpenPushController.h"
#import "CZScoreLiveController.h"
@interface CZPushRemindController ()


@end

@implementation CZPushRemindController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 创建组模型
    CZGroup *group = [[CZGroup alloc]init];
    
    // 2. 创建item模型
    CZItemArrow *item0 = [CZItemArrow itemWithIcon:nil title:@"开奖推送" target:[CZOpenPushController class]];
    
    
    CZItemArrow *item1 = [CZItemArrow itemWithIcon:nil title:@"比分直播推送" target:[CZScoreLiveController class]];
    CZItemArrow *item2 = [CZItemArrow itemWithIcon:nil title:@"中奖动画" target:[CZAwardAnimationController class]];
    CZItemArrow *item3 = [CZItemArrow itemWithIcon:nil title:@"购彩提醒" target:[CZBuyRemindController class]];
    CZItemArrow *item4 = [CZItemArrow itemWithIcon:nil title:@"圈子推送" target:[CZCirclePushController class]];
    
    group.items = @[item0, item1, item2, item3, item4];
    
    [self.data addObject:group];
   
}

@end
