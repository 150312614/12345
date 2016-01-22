//
//  CZItemLabel.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZItemLabel.h"

@implementation CZItemLabel
+ (instancetype)itemWithTitle:(NSString *)title value:(NSString *)value {
    CZItemLabel *item = [[self alloc]init];
    item.title = title;
    if (!item.value) {// 如果偏好设置没有保存时间，就用默认的
        // 覆盖偏好设置里面的值
        item.value = value;
    }
   
    return item;
}

@synthesize value = _value;
- (void)setValue:(NSString *)value {
    
   
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:value forKey:self.title];
    
    // 同步
    [defaults synchronize];
}

- (NSString *)value {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    return [defaults objectForKey:self.title];
}
@end
