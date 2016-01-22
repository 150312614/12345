//
//  CZItemSwitch.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZItemSwitch.h"

@implementation CZItemSwitch
- (void)setOn:(BOOL)on {
    // 数据操作
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setBool:on forKey:self.title];
    
    // 同步
    [defaults synchronize];

}

- (BOOL)isOn {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:self.title];
}
@end
