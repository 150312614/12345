//
//  CZMyLotteryController.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZMyLotteryController.h"

@interface CZMyLotteryController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation CZMyLotteryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1. 拉伸图片
    UIImage *image = [UIImage imageNamed:@"RedButtonPressed"];
    
    // 2. 拉伸图片要计算拉伸的点，只要这个点出了圆角的范围就可以
    
    NSInteger left = image.size.width * 0.5; // 系数值是从0-1
    NSInteger top = image.size.height * 0.5;
    
    // 2.1 width - leftCapWidth - 1   100 - 50 - 1 = 49
    // 2.2 height - topCapWidth - 1   50 -25 - 1 =  24
    
    image = [image stretchableImageWithLeftCapWidth:left topCapHeight:top];
    
    // 设置登录按钮背景图片
    [self.loginBtn setBackgroundImage:image forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
