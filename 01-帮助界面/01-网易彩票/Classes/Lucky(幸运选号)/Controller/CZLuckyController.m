//
//  CZLuckyController.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZLuckyController.h"
// com + op + 回车
@interface CZLuckyController ()
@property (weak, nonatomic) IBOutlet UIImageView *lightImageView;

@end

@implementation CZLuckyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1. 设置动画图片
    UIImage *image0 = [UIImage imageNamed:@"lucky_entry_light0"];
    
    UIImage *image1 = [UIImage imageNamed:@"lucky_entry_light1"];
    
    self.lightImageView.animationImages = @[image0, image1];
    
    // 2. 设置动画时间
    self.lightImageView.animationDuration = 0.1;
    
    
    // 3. 设置动画重复次数
    self.lightImageView.animationRepeatCount = 0;
    
    // 4. 开始执行动画
    [self.lightImageView startAnimating];
    
}

@end
