//
//  CZHelp.m
//  01-网易彩票
//
//  Created by apple on 15/12/20.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZHelp.h"

@implementation CZHelp
+ (instancetype)helpWithDict:(NSDictionary *)dict {
    CZHelp *help = [[self alloc]init];
    
    help.title = dict[@"title"];
    help.html = dict[@"html"];
    help.ID = dict[@"id"];
    return help;
}

+ (NSArray *)helps {
    // 1. 从文件中读取数据
    NSString *path = [[NSBundle mainBundle]pathForResource:@"help.json" ofType:nil];
    
    // 2. 从文件中读取数据转成 NSData
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    // 3. 把data 转成数组
    
    /*
     NSJSONReadingMutableContainers = (1UL << 0), 返回可变的容器
     NSJSONReadingMutableLeaves = (1UL << 1), 返回不可变的容器,如果加上 NSJSONReadingMutableContainers 之后，就变成可变容器(包括里面还有别的窗口)
     NSJSONReadingAllowFragments = (1UL << 2) 用来读取非正常格式的内容(一般情况不会使用)
     */
    
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *dataForHelp = [NSMutableArray array];
    for (NSDictionary *dict in json) {
        // 转成help模型
        CZHelp *help = [CZHelp helpWithDict:dict];
        [dataForHelp addObject:help];
    }
    return dataForHelp.copy;
}
@end
