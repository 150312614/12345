//
//  CZHallController.m
//  01-网易彩票
//
//  Created by apple on 15/12/16.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZHallController.h"

@interface CZHallController ()
@property (nonatomic,strong) UIView *coverView;
@property (nonatomic,strong) UIImageView *activityImageView;

@end

@implementation CZHallController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 用代码方式来创建活动按钮
    
    /*
     UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"CS50_activity_image"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:nil];
     
     self.navigationItem.leftBarButtonItem = item;
     
     */
    
}

- (IBAction)clickActivity:(id)sender {
    //    NSLog(@"点击活动按钮");
    // 要把View放到window
    // 获取程序唯一的window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 1. 创建遮罩层
    UIView *coverView = [[UIView alloc]initWithFrame:window.bounds];
    
    [window addSubview:coverView];
    // 设置背景色
    coverView.backgroundColor = [UIColor blackColor];
    // 设置透明度
    coverView.alpha = 0.5;
    
    // 2. 显示活动图片
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"showActivity"]];
    
    [window addSubview:imageView];
    
    // 把图片显示在window中间
    imageView.center = window.center;
    // 打开交互功能
    imageView.userInteractionEnabled = YES;
    
    
    self.coverView = coverView;
    self.activityImageView = imageView;
    
    // 3. 创建关闭按钮
    UIButton *closeBtn = [[UIButton alloc]init];
    
    
    // 添加按钮点击事件
    [closeBtn addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 设置图片
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    
    // 如果想要使用自动布局，就设为NO
//    closeBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    [imageView addSubview:closeBtn];
    
    // 用 frame 设置按钮位置
    // 如果你用纯代码。那你使用frame来算还是使用autolayout?
        closeBtn.frame = CGRectMake(CGRectGetWidth(imageView.frame) - 30, 0, 30, 30);
    // 自定布局第一种
    
    /*
     NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:closeBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:closeBtn.superview attribute:NSLayoutAttributeRight multiplier:1 constant:0];
     
     NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:closeBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:closeBtn.superview attribute:NSLayoutAttributeTop multiplier:1 constant:0];
     
     NSLayoutConstraint *constraintW = [NSLayoutConstraint constraintWithItem:closeBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30];
     
     NSLayoutConstraint *constraintH = [NSLayoutConstraint constraintWithItem:closeBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30];
     
     // 把约束添加到相关的view上
     [imageView addConstraints:@[constraintRight, constraintTop]];
     [closeBtn addConstraints:@[constraintW, constraintH]];
     */
    
    // 自定布局第二天
    
    // VFL
    // 一种 ：设置水平方向的约束(宽度) H:
    // 二：设置垂直方向的约束（高度）  V:
    /*
     1. | 表示superView的位置
     2. - 表示默认距离.如果是跟superView之间，默认为8
     
     // @30 NSNumber
     */
    
    
    /*
    // 往约束里面传参数
    NSDictionary *metrics = @{
                              @"value":@30
                              };
    
    // 跟约束相关的view
    NSDictionary *views = @{
                            @"btn":closeBtn
                            };
    
    NSArray *conH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[btn(==value)]-|" options:0 metrics:metrics views:views];
    
    NSArray *conV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[closeBtn(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(closeBtn)];
    
    [imageView addConstraints:conH];
    [imageView addConstraints:conV];
     
     */

}


- (void)closeClick {
    CGRect coverViewFrame = self.coverView.frame;
    coverViewFrame.origin.y = coverViewFrame.size.height;
    
    CGRect imageViewFrame = self.activityImageView.frame;
    imageViewFrame.origin.y = CGRectGetHeight(self.view.frame);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.coverView.frame = coverViewFrame;
        self.activityImageView.frame = imageViewFrame;
    } completion:^(BOOL finished) {
//        NSLog(@"完成了");
        [self.activityImageView removeFromSuperview];
        [self.coverView removeFromSuperview];
        self.activityImageView = nil;
        self.coverView = nil;
    }];
}
@end
