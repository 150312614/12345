//
//  CZCustomDatePicker.h
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZCustomDatePicker;
@protocol CZCustomDatePickerDelegate <NSObject>

// 可选
@optional
- (void)customDatePickerDidClickSure:(CZCustomDatePicker *)customDatePicker;
- (void)customDatePickerDidClickCancel:(CZCustomDatePicker *)customDatePicker;
- (void)customDatePickerDidClickChange:(CZCustomDatePicker *)customDatePicker;
@end

@interface CZCustomDatePicker : UIView

@property (nonatomic,strong) id model;

// 记录当前时间
@property (nonatomic,strong) NSDate *currentDate;

// 选择时间的最大值(结束时间)
@property (nonatomic,strong) NSDate *maxDate;

// 选择时间的最小值 (开始时间)
@property (nonatomic,strong) NSDate *minDate;



// 外部看到只读
@property(nonatomic,weak,readonly)UIDatePicker *datePicker;
// 显示
- (void)show;
// 隐藏
- (void)hide;

@property(nonatomic,weak)id<CZCustomDatePickerDelegate> delegate;
@end
