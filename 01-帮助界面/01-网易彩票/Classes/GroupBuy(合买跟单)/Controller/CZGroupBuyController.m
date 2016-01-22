//
//  CZGroupBuyController.m
//  01-网易彩票
//
//  Created by apple on 15/12/16.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZGroupBuyController.h"
#import "CZTitleButton.h"
#import "UIView+CZExp.h"
@interface CZGroupBuyController ()
@property (weak, nonatomic) IBOutlet CZTitleButton *titleBtn;
@property (nonatomic,strong) UIView *demoView;
@end

@implementation CZGroupBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
}

- (IBAction)clickTitleBtn:(CZTitleButton *)btn {
    
    if (self.demoView == nil) {
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(0, 0, self.view.width, 0);
        view.backgroundColor = [UIColor redColor];
        [self.view addSubview:view];
        self.demoView = view;
    }
    
    
    
    // 旋转按钮的图片
    [UIView animateWithDuration:0.3 animations:^{
        btn.imageView.transform = CGAffineTransformRotate(btn.imageView.transform, M_PI);
        if (self.demoView.height == 0) {
            self.demoView.frame = CGRectMake(0, 0, self.view.width, 250);
        }else {
            self.demoView.frame = CGRectMake(0, 0, self.view.width, 0);
        }
    } completion:^(BOOL finished) {
        // 收回去的时候才移除
        if (self.demoView.height == 0) {
            [self.demoView removeFromSuperview];
            self.demoView = nil;
        }
    }];
    
}


@end
