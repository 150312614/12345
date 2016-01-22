//
//  CZProductCell.m
//  01-网易彩票
//
//  Created by apple on 15/12/20.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZProductCell.h"
#import "CZProduct.h"
@interface CZProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation CZProductCell

- (void)awakeFromNib {
    // Initialization code
    // 设置图片圆角
    self.imageView.clipsToBounds = YES;
    self.imageView.layer.cornerRadius = 8;
}


- (void)setProduct:(CZProduct *)product {
    _product = product;
    self.imageView.image = [UIImage imageNamed:_product.icon];
    self.titleLabel.text = _product.title;
}
@end
