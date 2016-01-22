//
//  CZGroup.h
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZGroup : NSObject
@property (nonatomic,strong) NSArray *items;// 存放每一行的数据的数组集合
@property (nonatomic,copy) NSString *headerTitle;// 头部标题
@property (nonatomic,copy) NSString *footerTitle;// 尾部标题
@end
