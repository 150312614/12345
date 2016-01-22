//
//  CZCirclePushController.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZCirclePushController.h"
#import "CZItemHeader.h"
@interface CZCirclePushController ()

@end

@implementation CZCirclePushController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 创建组
    CZGroup *group = [[CZGroup alloc]init];
    group.footerTitle = @"开启如果是跟检测新版本类似的功能，我们需要执行一段代码如果是跟检测新版本类似的功能，我们需要执行一段代码";
    
    // 2. 创建item
    CZItemSwitch *item = [CZItemSwitch itemWithIcon:nil title:@"圈子消息推送"];
    
    group.items = @[item];
    
    // 3. 添加到数据源的数组
    [self.data addObject:group]; // 1. 创建组
    
    
    
    
    CZGroup *group1 = [[CZGroup alloc]init];
       // 2. 创建item
    CZItemSwitch *item1 = [CZItemSwitch itemWithIcon:nil title:@"圈子仅wifi加载图片"];
    
    group1.items = @[item1];
    
    // 3. 添加到数据源的数组
    [self.data addObject:group1];
}


@end
