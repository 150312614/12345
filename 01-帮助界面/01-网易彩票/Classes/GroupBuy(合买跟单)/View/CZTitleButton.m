//
//  CZTitleButton.m
//  01-网易彩票
//
//  Created by apple on 15/12/16.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZTitleButton.h"
#import "UIView+CZExp.h"
@interface CZTitleButton ()
@property (nonatomic, assign) CGSize titleSize;// 计算出来的标题大小
@end

@implementation CZTitleButton

// 从storyboard 加载的view会走哪个方法?
- (void)awakeFromNib {
    /*
    NSDictionary *att = @{
                          NSFontAttributeName : self.titleLabel.font
                          };
    // 要计算标题的宽高
    self.titleSize = [self.currentTitle boundingRectWithSize:self.frame.size options:0 attributes:att context:nil].size;
     */
}
/**
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    // 图片宽度
    CGFloat imageW = self.currentImage.size.width;
    
    // 如果使用self.imageView.frame 会造成死循环
    
    return CGRectMake(CGRectGetWidth(self.frame) - self.currentImage.size.width, (CGRectGetHeight(self.frame) -  imageW) * 0.5 , imageW, imageW);
}
*/
//- (CGRect)titleRectForContentRect:(CGRect)contentRect {
//    
//    /*
//     NSDictionary *att = @{
//     NSFontAttributeName : self.titleLabel.font
//     };
//     // 要计算标题的宽高
//     CGSize size = [self.currentTitle boundingRectWithSize:contentRect.size options:0 attributes:att context:nil].size;
//     */
//    
//    CGFloat btnY = (CGRectGetHeight(contentRect) - self.titleSize.height) * 0.5;
//    
//    return CGRectMake(0, btnY, self.titleSize.width, self.titleSize.height);
//}

// 子控件布局还可以使用layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 第二种方式
    /*
    // 设置label 的frame
    CGFloat btnY = (CGRectGetHeight(self.frame) - self.titleSize.height) * 0.5;
   
    self.titleLabel.frame = CGRectMake(0, btnY, self.titleSize.width, self.titleSize.height);
    
    // 设置图片的frame
    // 图片宽度
    CGFloat imageW = self.currentImage.size.width;
    
    // 如果使用self.imageView.frame 会造成死循环
    
    self.imageView.frame =  CGRectMake(CGRectGetWidth(self.frame) - self.currentImage.size.width, (CGRectGetHeight(self.frame) -  imageW) * 0.5 , imageW, imageW);
     */
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width + 8;
}


@end
