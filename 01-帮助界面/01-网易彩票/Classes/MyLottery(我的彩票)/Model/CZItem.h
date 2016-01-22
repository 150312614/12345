//
//  CZItem.h
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger , CZItemAccessoryType) {
///  箭头
    CZItemAccessoryTypeArrow ,
///  开关
    CZItemAccessoryTypeSwitch
};
@interface CZItem : NSObject
@property (nonatomic,copy) NSString *icon;// 图标
@property (nonatomic,copy) NSString *title; // 标题
@property (nonatomic,copy) NSString *subTitle; // 副标题

@property (nonatomic,copy) void (^block)();
//@property (nonatomic, assign) CZItemAccessoryType type;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

@end
