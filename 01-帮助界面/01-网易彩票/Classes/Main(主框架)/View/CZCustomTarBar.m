//
//  CZCustomTarBar.m
//  01-网易彩票
//
//  Created by apple on 15/12/16.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZCustomTarBar.h"
#import "CZTabBarButton.h"

@interface CZCustomTarBar ()
@property (nonatomic,strong) CZTabBarButton *selectedButton;
@end

@implementation CZCustomTarBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor redColor];
        /*
         for (int i = 0; i < 5; i++) {
            // 父类 指向 子类 (不能用子类的方法和属性)
            CZTabBarButton *button = [[CZTabBarButton alloc]init];
            
            // 默认状态的图片
            NSString *normalName = [NSString stringWithFormat:@"TabBar%d",i + 1];
            
            // 选中状态的图片
            NSString *selectName = [NSString stringWithFormat:@"TabBar%dSel",i + 1];
            
           
            
            [button setBackgroundImage:[UIImage imageNamed:normalName] forState:UIControlStateNormal];
            
            [button setBackgroundImage:[UIImage imageNamed:selectName] forState:UIControlStateSelected];
            
            [self addSubview:button];
            
            // 添加点击事件
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
            
            // 默认选中
            if (i == 0) {
//                button.selected = YES;
//                self.selectedButton = button;
                [self buttonClick:button];
            }
        }
         
         */

    }
    return self;
}

- (void)addButtonWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName {
    // 父类 指向 子类 (不能用子类的方法和属性)
    CZTabBarButton *button = [[CZTabBarButton alloc]init];
    
    
    [button setBackgroundImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    
    [self addSubview:button];
    
    // 添加点击事件
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
}

- (void)buttonClick:(CZTabBarButton *)btn {
//    NSLog(@"点击按钮");
    
    // 取消上一个被选中的按钮
    self.selectedButton.selected = NO;
    
    // 选中当前点击的按钮
    btn.selected = YES;
    
    // 记录当前点击的按钮
    self.selectedButton = btn;
    
    // 按钮有tag
    
    // 调用代理方法
    if (self.delegate && [self.delegate respondsToSelector:@selector(customTabBar:didClickAtIndex:)]) {
        [self.delegate customTabBar:self didClickAtIndex:btn.tag];
    }
}

// 计算子控件frame
- (void)layoutSubviews {
    [super layoutSubviews];
    for (int i = 0; i < self.subviews.count; i++) {
        CZTabBarButton *button = self.subviews[i];
        
        // 设置按钮的tag值
        button.tag = i;
        
        // 宽度
        CGFloat btnW = self.frame.size.width / self.subviews.count;
        // 高度
        CGFloat btnH = CGRectGetHeight(self.frame);
        
        // X值
        CGFloat btnX = btnW * i;
        
        button.frame = CGRectMake(btnX, 0, btnW, btnH);
        
        // 默认选中
        if (i == 0) {
            //                button.selected = YES;
            //                self.selectedButton = button;
            [self buttonClick:button];
        }
    }
}

@end
