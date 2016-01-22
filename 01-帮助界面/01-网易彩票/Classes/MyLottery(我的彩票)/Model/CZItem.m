//
//  CZItem.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZItem.h"

@implementation CZItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title {
    CZItem *item = [[self alloc]init];// self 为了保证子类调用生成的对象是子类的，而不是父类的
    item.icon = icon;
    item.title = title;
    return item;
}


@end
