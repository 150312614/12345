//
//  CZItemLabel.h
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZItem.h"

@interface CZItemLabel : CZItem
+ (instancetype)itemWithTitle:(NSString *)title value:(NSString *)value;
@property (nonatomic,copy) NSString *value;// label的值
@end
