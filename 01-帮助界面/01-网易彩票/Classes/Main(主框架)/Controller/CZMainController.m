//
//  CZMainController.m
//  01-网易彩票
//
//  Created by apple on 15/12/16.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZMainController.h"
#import "CZCustomTarBar.h"
#import "CZNavController.h"
@interface CZMainController ()<CZCustomTarBarDelegate>

@end

@implementation CZMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始的时候，默认加载五个控制器
    [self loadViewControllers];
   
    
    // 添加自定义的TabBar
    CZCustomTarBar *customTabBar = [[CZCustomTarBar alloc]init];
    customTabBar.delegate = self;
    // 添加到self.view 不能在push的时候隐藏
//    [self.view addSubview:customTabBar];
    // 要把自定义的tabBar 添加到系统的tabbar 上面
    [self.tabBar addSubview:customTabBar];
    
    customTabBar.frame = self.tabBar.bounds;
    // 移除系统的Tabbar
//    [self.tabBar removeFromSuperview];
    // 自定义的TabBar 显示多少个按钮，以及按钮显示的图片，都应该由子控制器来决定
    for (int i = 0; i < self.viewControllers.count; i++) {
        // 默认状态的图片
        NSString *normalName = [NSString stringWithFormat:@"TabBar%d",i + 1];
        
        // 选中状态的图片
        NSString *selectName = [NSString stringWithFormat:@"TabBar%dSel",i + 1];
        
        // 动态创建自定义TabBar 的按钮
        [customTabBar addButtonWithNormalImageName:normalName selectedImageName:selectName];
    }
}



// 加载五个导航栏控制器
- (void)loadViewControllers {
    UINavigationController *hallNav = [self controllerWithStoryBoardName:@"Hall"];
//    hallNav.tabBarItem.title = @"购彩大厅";
    // 系统会默认帮我们渲染图片
//    hallNav.tabBarItem.image = [[UIImage imageNamed:@"TabBar1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 合买跟单
    UINavigationController *groupBuyNav = [self controllerWithStoryBoardName:@"GroupBuy"];
    
    // 幸运选号
    UINavigationController *luckyNav = [self controllerWithStoryBoardName:@"Lucky"];
    
    // 开奖信息
    UINavigationController *openAwardNav = [self controllerWithStoryBoardName:@"OpenAward"];
    
    // 我的彩票
    UINavigationController *myLotteryNav = [self controllerWithStoryBoardName:@"MyLottery"];
    
    
    // 6. 把控制器加到TabBar 中去
    //    [self addChildViewController:hallNav];
    self.viewControllers = @[hallNav, groupBuyNav, luckyNav, openAwardNav, myLotteryNav];
}

// 从storyboard 加载初始化控制器
- (UINavigationController *)controllerWithStoryBoardName:(NSString *)name {
    UIStoryboard *hallSb = [UIStoryboard storyboardWithName:name bundle:nil];
    
    UINavigationController *nav = [hallSb instantiateInitialViewController];
    
    // 返回初始化的控制器
    return nav;
}



#pragma mark - 自定义TabBar的代理
- (void)customTabBar:(CZCustomTarBar *)tabBar didClickAtIndex:(NSInteger)index {
    self.selectedIndex = index;
    // 跳转其他界面
    
}


@end
