//
//  CZProduct.h
//  01-网易彩票
//
//  Created by apple on 15/12/20.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZProduct : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *icon;

+ (instancetype)productWithDict:(NSDictionary *)dict;

+ (NSArray *)products;

@end
