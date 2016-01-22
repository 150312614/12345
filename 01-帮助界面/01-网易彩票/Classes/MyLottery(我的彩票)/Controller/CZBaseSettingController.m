//
//  CZBaseSettingController.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZBaseSettingController.h"
#import "CZGroup.h"
#import "CZItem.h"
#import "CZSettingCell.h"
#import "CZItemArrow.h"
@interface CZBaseSettingController ()
@property (nonatomic,strong) NSMutableArray *data;// 不声明只读，为了保证在.m文件正常初始化数组
@end

@implementation CZBaseSettingController

- (instancetype)init {
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {// 判断如果self 实例化了
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景图片
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    // 设置组之间的间隔
    //    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 0;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-15, 0, 0, 0);
    
    // 去除分隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (NSMutableArray *)data {
    if (_data == nil) {
        _data = [NSMutableArray array];
    }
    return _data;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 取出组里面的数据
    CZGroup *group = self.data[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CZSettingCell *cell = [CZSettingCell settingCellWithTableView:tableView];
    
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

// 点击tableViewcell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取出对应行的数据
    CZGroup *group = self.data[indexPath.section];
    
    CZItem *item = group.items [indexPath.row];
    
    // 判断block 是否有值
    if (item.block) {
        item.block();// 执行block
        return;
    }
    
    if ([item isKindOfClass:[CZItemArrow class]]) {
        
        CZItemArrow *itemArrow = (CZItemArrow *)item;
        
        
        // 只要文件中或者 plist 中保存了要跳转的控制器就可以了
        //    NSLog(@"点击cell");
        //        NSString *vcName = itemArrow.target;// 目标控制器
        Class class = itemArrow.target;
        
        // 创建控制器
        UIViewController *vc = [[class alloc]init];
        
        if (vc) {// 判断如果有跳转的控制器才去跳转
            vc.title = item.title;
            // Push
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
    // 如果是跟检测新版本类似的功能，我们需要执行一段代码
    // 用plist文件无法完成保存一段代码以后执行
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    CZGroup *group = self.data[section];
    return group.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    CZGroup *group = self.data[section];
    return group.footerTitle;
}

@end
