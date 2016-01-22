//
//  CZScoreLiveController.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZScoreLiveController.h"
#import "CZItemHeader.h"
#import "CZCustomDatePicker.h"
#import "NSDate+CZFormat.h"
@interface CZScoreLiveController ()<CZCustomDatePickerDelegate>

@end

@implementation CZScoreLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 创建组
    CZGroup *group = [[CZGroup alloc]init];
    group.footerTitle = @"开启开启开启开启开启开启开启开启开启开启开启开启开启";
    
    // 2. 创建item
    CZItemSwitch *item = [CZItemSwitch itemWithIcon:nil title:@"推送我关注的比赛"];
    
    group.items = @[item];
    
    // 3. 添加到数据源的数组
    [self.data addObject:group];
    
  
    // 创建第二组
    CZGroup *group1 = [[CZGroup alloc]init];
    group1.headerTitle = @"只有在以下时间段内接收比分直播推送";
    
    CZItemLabel *item1 = [CZItemLabel itemWithTitle:@"起始时间" value:@"09:00"];
   
    
    group1.items = @[item1];
    
    [self.data addObject:group1];
    
    // 初始化第三组的item2
    CZItemLabel *item2 = [CZItemLabel itemWithTitle:@"结束时间" value:@"17:00"];;
   
    
    [item1 setBlock:^{
//        NSLog(@"弹出时间选择器");
        /*
         当我们用block的时候，把对应的item传到CZCustomDatePicker
         */
        // 1. 弹出时间选择器
        CZCustomDatePicker *datePicker = [[CZCustomDatePicker alloc]init];
        datePicker.delegate = self;
        
        datePicker.currentDate = [NSDate dateWithString:item1.value format:@"HH:mm"];// 为了点击取消的时候还原,还可以起到对比时间的时候有统一的日期
        
        // 记录当前点击的是item1
        datePicker.model = item1;
        
        // 约束最大时间(不能超过结束时间)
        datePicker.maxDate = [NSDate dateWithString:item2.value format:@"HH:mm"];
        
        [datePicker show];
        
    }];
    
    // 第三组
    CZGroup *group2 = [[CZGroup alloc]init];
    
    
    [item2 setBlock:^{
        //        NSLog(@"弹出时间选择器");
        // 1. 弹出时间选择器
        CZCustomDatePicker *datePicker = [[CZCustomDatePicker alloc]init];
        datePicker.delegate = self;
        
//        datePicker.currentDate = [NSDate dateWithString:item2.value format:@"HH:mm"];
        
        // 记录当前弹出时间选择器的模型
        datePicker.model = item2;
        
        // 设置最小时间(开始时间)
        datePicker.minDate = [NSDate dateWithString:item1.value format:@"HH:mm"];
        [datePicker show];
        
    }];
    group2.items = @[item2];
    
    [self.data addObject:group2];
}

// 想办法记录当前点击的是哪个item?
// 如果能获取到相关的模型，改一下数据
- (void)customDatePickerDidClickSure:(CZCustomDatePicker *)customDatePicker {
//    NSLog(@"%@",customDatePicker.datePicker.date);
//    NSLog(@"%@",customDatePicker.model);
    // 取出当前选中的时间
    NSDate *date = customDatePicker.datePicker.date;
    
    
    CZItemLabel *item = customDatePicker.model;
    item.value = [date stringWithFormat:@"HH:mm"];
    [self.tableView reloadData];
}

- (void)customDatePickerDidClickChange:(CZCustomDatePicker *)customDatePicker {
    NSLog(@"%@",customDatePicker.datePicker.date);
    // 取出当前选中的时间
    NSDate *date = customDatePicker.datePicker.date;
    
    CZItemLabel *item = customDatePicker.model;
    item.value = [date stringWithFormat:@"HH:mm"];
    [self.tableView reloadData];
}

- (void)customDatePickerDidClickCancel:(CZCustomDatePicker *)customDatePicker {
    // 拿出旧的时间
    NSDate *date = customDatePicker.currentDate;
    
    
    CZItemLabel *item = customDatePicker.model;
    item.value = [date stringWithFormat:@"HH:mm"];
    [self.tableView reloadData];
}
@end
