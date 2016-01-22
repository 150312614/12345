//
//  CZHelp.h
//  01-网易彩票
//
//  Created by apple on 15/12/20.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZHelp : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *html;
@property (nonatomic,copy) NSString *ID;



+ (instancetype)helpWithDict:(NSDictionary *)dict;
// 从文件中读取数据并返回
+ (NSArray *)helps;
@end
