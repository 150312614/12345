//
//  UIView+CZExp.h
//  01-网易彩票
//
//  Created by apple on 15/12/16.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CZExp)
//@property (nonatomic, assign) CGFloat x;// 相当于声明了setter 和 getter 方法,并没有往内存里添加新的属性
//@property (nonatomic, assign) CGFloat y;
//@property (nonatomic, assign) CGFloat width;
//@property (nonatomic, assign) CGFloat height;

- (void)setX:(CGFloat)x;
- (CGFloat)x;

- (void)setY:(CGFloat)y;
- (CGFloat)y;

- (void)setWidth:(CGFloat)width;
- (CGFloat)width;

- (void)setHeight:(CGFloat)height;
- (CGFloat)height;
@end
