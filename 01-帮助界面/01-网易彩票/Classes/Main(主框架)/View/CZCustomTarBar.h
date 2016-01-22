//
//  CZCustomTarBar.h
//  01-网易彩票
//
//  Created by apple on 15/12/16.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZCustomTarBar;
@protocol CZCustomTarBarDelegate <NSObject>

@optional
- (void)customTabBar:(CZCustomTarBar *)tabBar didClickAtIndex:(NSInteger)index;

@end

@interface CZCustomTarBar : UIView

- (void)addButtonWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName;
@property (nonatomic, weak) id<CZCustomTarBarDelegate> delegate;

@end
