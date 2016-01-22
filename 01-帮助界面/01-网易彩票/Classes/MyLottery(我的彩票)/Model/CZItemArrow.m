//
//  CZItemArrow.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZItemArrow.h"

@implementation CZItemArrow
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title target:(Class)target {
    CZItemArrow *item = [self itemWithIcon:icon title:title];
    item.target = target;
    return item;
}

@end
