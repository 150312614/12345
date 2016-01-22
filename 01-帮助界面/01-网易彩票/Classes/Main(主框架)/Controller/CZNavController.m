//
//  CZNavController.m
//  01-网易彩票
//
//  Created by apple on 15/12/16.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZNavController.h"

@interface CZNavController ()

@end

@implementation CZNavController


// 是程序一启动就会执行,
// 有可能我用不到
//+ (void)load {
//    NSLog(@"load");
//}

// 在第一次使用的时候
/*
 1. 如果存在子类，子类没有实现这个方法，就会来父调用
 2.
 */
+ (void)initialize {
    //    NSLog(@"initialize");
    
    if (self == [CZNavController class]) {
        
        //     NSLog(@"%@",self);
        
        // 如果保证代码只执行一次？
        // 分别产生了五个对象，都有这个run的属性
        
        // 我们可以通过获取全局的对象来设置
        UINavigationBar *bar = [UINavigationBar appearance];
        
        // 设置导航栏背景图片
        
        //    UIBarMetricsDefault, 横竖屏都可以
        //    UIBarMetricsCompact, 只有横屏可以使用
        [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        
        NSDictionary *att = @{
                              NSForegroundColorAttributeName:[UIColor whiteColor],
                              NSFontAttributeName:[UIFont systemFontOfSize:18.f]
                              };
        // 设置标题样式
        [bar setTitleTextAttributes:att];
        
        UIBarButtonItem *item = [UIBarButtonItem appearance];
        
        // 设置导航栏上面的item 的 字体属性
        [item setTitleTextAttributes:att forState:UIControlStateNormal];
        
        // 设置返回按钮的图片或者标题的颜色
        bar.tintColor = [UIColor whiteColor];
        
        // 也可以用来设计导航栏的背景颜色
        //    bar.barTintColor = [UIColor redColor];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

// 不管是storyboard 还是 用纯代码来push 都会走这个方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    //    NSLog(@"push");
    // 只要是这个导航栏下面的控制器push都会隐藏tabbar
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:YES];
}

// 纯代码会走这个吗？
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender


@end
