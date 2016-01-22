//
//  CZItemArrow.h
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZItem.h"

@interface CZItemArrow : CZItem
//@property (nonatomic,copy) NSString *target; // 要跳转的控制器
@property (nonatomic,assign) Class target;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title target:(Class)target;

@end
