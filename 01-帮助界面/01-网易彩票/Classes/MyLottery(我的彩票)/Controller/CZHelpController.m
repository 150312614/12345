//
//  CZHelpController.m
//  01-网易彩票
//
//  Created by apple on 15/12/20.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZHelpController.h"
#import "CZItemHeader.h"
#import "CZHelp.h"
#import "CZHTMLController.h"
#import "CZNavController.h"
@interface CZHelpController ()
@property (nonatomic,strong) NSArray *dataForHelp;

@end

@implementation CZHelpController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataForHelp];
}

- (NSArray *)dataForHelp {
    if (_dataForHelp == nil) {
        _dataForHelp = [CZHelp helps];
        // 把help 转成 item 类型才能正常显示
        
        // 创建组模型
        CZGroup *group = [[CZGroup alloc]init];
        NSMutableArray *items = [NSMutableArray array];
        for (CZHelp *help in _dataForHelp) {
            CZItemArrow *item = [CZItemArrow itemWithIcon:nil title:help.title target:[CZHTMLController class]];
            [items addObject:item];
        }
        group.items = items.copy;
        [self.data addObject:group];
        
    }
    return _dataForHelp;
}

// 重写点击cell 的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取出class
    // 取出对应行的数据
    CZGroup *group = self.data[indexPath.section];
    
    CZItemArrow *item = group.items [indexPath.row];
    Class class = item.target;
    
    CZHTMLController *html = [[class alloc]init];
    // 要往html 控制器传参数
    html.help = self.dataForHelp[indexPath.row];
    
    // 创建导航栏
    CZNavController *nav = [[CZNavController alloc]initWithRootViewController:html];
    
    [self presentViewController:nav animated:YES completion:nil];
}

@end
