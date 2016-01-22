//
//  AppDelegate.m
//  01-网易彩票
//
//  Created by apple on 15/12/16.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "AppDelegate.h"
#import "CZMainController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    // Override point for customization after application launch.
    // 设置状态栏样式
    application.statusBarStyle = UIStatusBarStyleLightContent;
    application.statusBarHidden = NO;
    
    // 1. 创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    // 2. 创建TabBar
    CZMainController *main = [[CZMainController alloc]init];
    
    // 3. 设置根控制器
    self.window.rootViewController = main;
    
    // 4. 把window 显示出来
    [self.window makeKeyAndVisible];
    
    // 5. 从storyboard ==>sb
//    UIStoryboard *hallSb = [UIStoryboard storyboardWithName:@"Hall" bundle:nil];
//    
//    UINavigationController *hallNav = [hallSb instantiateInitialViewController];
    // 购彩大厅
    // com+ op + 左剪头
    {
        /*
         UINavigationController *hallNav = [self controllerWithStoryBoardName:@"Hall"];
         hallNav.tabBarItem.title = @"";
         
         // 合买跟单
         UINavigationController *groupBuyNav = [self controllerWithStoryBoardName:@"GroupBuy"];
         
         // 幸运选号
         UINavigationController *luckyNav = [self controllerWithStoryBoardName:@"Lucky"];
         
         // 开奖信息
         UINavigationController *openAwardNav = [self controllerWithStoryBoardName:@"OpenAward"];
         
         // 我的彩票
         UINavigationController *myLotteryNav = [self controllerWithStoryBoardName:@"MyLottery"];
         
         
         // 6. 把控制器加到TabBar 中去
         //    [main addChildViewController:hallNav];
         main.viewControllers = @[hallNav, groupBuyNav, luckyNav, openAwardNav, myLotteryNav];
         */
    }
    
    // 还要添加其他样式的内容.
    
    // 启动画面更久
//    sleep(2);
    
    return YES;
}

// 从storyboard 加载初始化控制器
- (UINavigationController *)controllerWithStoryBoardName:(NSString *)name {
    UIStoryboard *hallSb = [UIStoryboard storyboardWithName:name bundle:nil];
    
    UINavigationController *nav = [hallSb instantiateInitialViewController];
    
    // 返回初始化的控制器
    return nav;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
