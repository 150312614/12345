//
//  CZProductController.m
//  01-网易彩票
//
//  Created by apple on 15/12/20.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZProductController.h"
#import "CZProduct.h"
#import "CZProductCell.h"
@interface CZProductController ()
@property (nonatomic,strong) NSArray *data;
@end

@implementation CZProductController



- (instancetype)init {
    // 创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    // 设置item 大小
    layout.itemSize = CGSizeMake(81, 98);
    
    if (self = [super initWithCollectionViewLayout:layout]) {
        
    }
    return self;
}

- (NSArray *)data {
    if (_data == nil) {
        _data = [CZProduct products];
    }
    
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.backgroundColor = [UIColor whiteColor];
    // 注册cell 的类型
    [self.collectionView registerNib:[UINib nibWithNibName:@"CZProductCell" bundle:nil] forCellWithReuseIdentifier:@"CZProductCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"CZProductCell";
    CZProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    // 设置item 对应的数据
    cell.product = self.data[indexPath.item];
    return cell;
}


@end
