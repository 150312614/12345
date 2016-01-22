//
//  CZAwardAnimationController.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZAwardAnimationController.h"
#import "CZGroup.h"
#import "CZItem.h"
#import "CZSettingCell.h"
#import "CZItemArrow.h"
#import "CZItemSwitch.h"
@interface CZAwardAnimationController ()

@end

@implementation CZAwardAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 创建组
    CZGroup *group = [[CZGroup alloc]init];
    group.footerTitle = @"开启如果是跟检测新版本类似的功能，我们需要执行一段代码如果是跟检测新版本类似的功能，我们需要执行一段代码";
    
    // 2. 创建item
    CZItemSwitch *item = [CZItemSwitch itemWithIcon:nil title:@"中奖动画"];
    
    group.items = @[item];
    
    // 3. 添加到数据源的数组
    [self.data addObject:group];
}



@end
