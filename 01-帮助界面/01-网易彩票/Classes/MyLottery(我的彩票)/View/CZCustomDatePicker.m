//
//  CZCustomDatePicker.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZCustomDatePicker.h"
#import "CZTool.h"
#import "UIView+CZExp.h"
@interface CZCustomDatePicker ()<CZToolDelegate>
///  工具条
@property(nonatomic,weak)CZTool *tool;
///  时间选择 内部看到可以读写
@property(nonatomic,weak)UIDatePicker *datePicker;

@property(nonatomic,weak)UIButton *close;

@end

@implementation CZCustomDatePicker

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 1. 添加工具条
        [self setupTool];
        // 2. 添加时间选择器
        [self setupDatePicker];
    }
    
    return self;
}


// 初始化工具条 // 高40
- (void)setupTool {
    CZTool *tool = [CZTool tool];
    [self addSubview:tool];
    self.tool = tool;
    self.tool.delegate = self;
}

// 初始化时间选择
- (void)setupDatePicker {
    UIDatePicker *picker = [[UIDatePicker alloc]init];
    
    // 设置语言为中文
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];// 如果不设置会跟随系统
    
    // 设置选择的是时间
    picker.datePickerMode = UIDatePickerModeTime;
    
    [self addSubview:picker];
    
    self.datePicker = picker;
    
    // 监听datePicker改变
    [picker addTarget:self action:@selector(datePickerChange) forControlEvents:UIControlEventValueChanged];
}

- (void)datePickerChange {
//    NSLog(@"%@",self.datePicker.date);
    // 调用代理方法
    if (self.delegate && [self.delegate respondsToSelector:@selector(customDatePickerDidClickChange:)]) {
        [self.delegate customDatePickerDidClickChange:self];
    }
}

- (void)show {
    // 获取主窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 加一层蒙板
    UIButton *close = [[UIButton alloc]init];
    
    close.frame = window.bounds;
    [window addSubview:close];
    
    self.close = close;
    
    // 添加点击事件
    [close addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchDown];
    
    
    [window addSubview:self];
    
    self.height = 256; // 时间选择器为216 工具条40
    self.width = window.width;
    self.y = window.height;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.y = window.height - self.height;
    }];
}

- (void)hide {
    [UIView animateWithDuration:0.3 animations:^{
        self.y += self.height;
    } completion:^(BOOL finished) {
        [self.close removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置工具条位置
    self.tool.width = self.width;
    
    // 设置时间选择器
    self.datePicker.y = self.tool.height;
    
}

#pragma mark - 工具条代理

- (void)toolDidClickCancel:(CZTool *)tool {
    [self hide];
    if (self.delegate && [self.delegate respondsToSelector:@selector(customDatePickerDidClickCancel:)]) {
        [self.delegate customDatePickerDidClickCancel:self];
    }
    
}

- (void)toolDidClickSure:(CZTool *)tool {
    [self hide];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customDatePickerDidClickSure:)]) {
        [self.delegate customDatePickerDidClickSure:self];
    }
}

- (void)setCurrentDate:(NSDate *)currentDate {
    _currentDate = currentDate;
    // 设置时间选择器记录的是当前模型显示时间，而不是系统的时间
    self.datePicker.date = _currentDate;
}


- (void)setMaxDate:(NSDate *)maxDate {
    _maxDate = maxDate;
    self.datePicker.maximumDate = _maxDate;
}

- (void)setMinDate:(NSDate *)minDate {
    _minDate = minDate;
    self.datePicker.minimumDate = _minDate;
}
                       

@end
