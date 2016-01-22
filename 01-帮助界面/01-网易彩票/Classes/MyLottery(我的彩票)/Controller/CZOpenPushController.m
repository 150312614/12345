//
//  CZOpenPushController.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZOpenPushController.h"
#import "CZItemHeader.h"
#import "UIView+CZExp.h"
@interface CZOpenPushController ()

@end

@implementation CZOpenPushController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CZGroup *group = [[CZGroup alloc]init];
    
    
    CZItemSwitch *item0 = [CZItemSwitch itemWithIcon:nil title:@"双色球"];
    item0.subTitle = @"每周二，四，日开奖";
    
    CZItemSwitch *item1 = [CZItemSwitch itemWithIcon:nil title:@"大乐透"];
    item1.subTitle = @"每周二，四，日开奖";
    
    CZItemSwitch *item2 = [CZItemSwitch itemWithIcon:nil title:@"3D"];
    item2.subTitle = @"每周二，四，日开奖";
    
    CZItemSwitch *item3 = [CZItemSwitch itemWithIcon:nil title:@"七乐彩"];
    item3.subTitle = @"每周二，四，日开奖";
    
    CZItemSwitch *item4 = [CZItemSwitch itemWithIcon:nil title:@"七星彩"];
    item4.subTitle = @"每周二，四，日开奖";
    
    CZItemSwitch *item5 = [CZItemSwitch itemWithIcon:nil title:@"排列3"];
    item5.subTitle = @"每周二，四，日开奖";
    
    CZItemSwitch *item6 = [CZItemSwitch itemWithIcon:nil title:@"排列5"];
    item6.subTitle = @"每周二，四，日开奖";
    
    group.items = @[item0, item1, item2, item3, item4, item5, item6];
    
    [self.data addObject:group];
    
    // 添加tableView 的 headerView
    self.tableView.tableHeaderView = [[[NSBundle mainBundle]loadNibNamed:@"CZOpenPushHeaderView" owner:nil options:nil]lastObject];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

// 父类不能满足子类的需求，我们就要重写方法自己来搞定
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CZSettingCell *cell = [CZSettingCell settingCellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    
    // 取出对应行的数据
    CZGroup *group = self.data[indexPath.section];
    
    CZItem *item = group.items [indexPath.row];
    
    // 把模型设置到cell里面
    cell.item = item;
    
    // 判断是否需要显示分隔线,如果是最后一行，不需要显示
    if (indexPath.row != (group.items.count - 1)) {
        [cell showLine:YES];
    }else {
        [cell showLine:NO];
    }
    
    return cell;
}

@end
