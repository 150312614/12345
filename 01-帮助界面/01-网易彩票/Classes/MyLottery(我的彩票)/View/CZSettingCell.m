//
//  CZSettingCell.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZSettingCell.h"
#import "CZItemArrow.h"
#import "CZItemSwitch.h"
#import "UIView+CZExp.h"
#import "CZItemLabel.h"

@interface CZSettingCell ()
@property (nonatomic,strong) UIView *line;
@property (nonatomic,strong) UIImageView *accessoryArrow;// 箭头
@property (nonatomic,strong) UISwitch *accessorySwitch; // 开关
@property (nonatomic,strong) UILabel *accessoryLabel; // label


@end

@implementation CZSettingCell

+ (instancetype)settingCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"Cell";
    CZSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 要使用此方法，必须注册cell的类型，要么控制器用代码注册，要么在sb里面注册
    //    [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath]
    // 判断cell是否为nil
    if (cell == nil) {
        cell = [[CZSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //
    }
    
    return cell;
}

+ (instancetype)settingCellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style {
    static NSString *ID = @"Cell1";
    CZSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 要使用此方法，必须注册cell的类型，要么控制器用代码注册，要么在sb里面注册
    //    [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath]
    // 判断cell是否为nil
    if (cell == nil) {
        cell = [[CZSettingCell alloc]initWithStyle:style reuseIdentifier:ID];
        //
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化的时候设置cell的样式
        [self setupStyle];
    }
    return self;
}

// 设置cell 的样式
- (void)setupStyle {
    // 设置字体颜色和大小
    self.textLabel.font = [UIFont systemFontOfSize:16.f];
    self.textLabel.textColor = [UIColor grayColor];
    
    self.detailTextLabel.textColor = [UIColor lightGrayColor];
    
    // 设置选中的效果
    UIView *selectBG = [[UIView alloc]init];
    selectBG.backgroundColor = [UIColor colorWithRed:225 / 255.0 green:219 / 255.0 blue:219 / 255.0 alpha:1];
    self.selectedBackgroundView = selectBG;
    
    // 设置分隔线
}

// 分隔线
- (UIView *)line {
    if (_line == nil) {
        _line = [[UIView alloc]init];
        [self.contentView addSubview:_line];
        _line.backgroundColor = [UIColor grayColor];
        _line.alpha = 0.8;
        _line.hidden = YES;
    }
    return _line;
}

///  设置cell 里面的数据
///
///  @param item
- (void)setItem:(CZItem *)item {
    _item = item;
    // 设置 cell 里面的数据
//    CUICatalog: Invalid asset name supplied: (null)
// 如果图片名字为nil 就会报此错误
    if (_item.icon) {
        self.imageView.image = [UIImage imageNamed:_item.icon];
    }

    self.textLabel.text = _item.title;
    // 显示副标题
    self.detailTextLabel.text = _item.subTitle;
    
    // 判断是否需要显示选中效果
    self.selectionStyle = [item isKindOfClass:[CZItemSwitch class]] ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault;
    
    if ([_item isKindOfClass:[CZItemArrow class]]) {// 箭头
        self.accessoryView = self.accessoryArrow;

    }else if ([item isKindOfClass:[CZItemSwitch class]]) {// 开关
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        CZItemSwitch *itemSwitch = (CZItemSwitch *)item;
        // 设置开关的默认值
        self.accessorySwitch.on = itemSwitch.isOn;
        
        self.accessoryView = self.accessorySwitch;
        // 让cell不显示选中状态
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if ([item isKindOfClass:[CZItemLabel class]]) {
        self.accessoryView = self.accessoryLabel;
       CZItemLabel *itemLabel = (CZItemLabel *)item;
        self.accessoryLabel.text = itemLabel.value;
      
        // 自适应内容大小
        [self.accessoryLabel sizeToFit];
    }
    
}

- (UIImageView *)accessoryArrow {
    if (_accessoryArrow == nil) {
        _accessoryArrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _accessoryArrow;
}

- (UISwitch *)accessorySwitch {
    if (_accessorySwitch == nil) {
        _accessorySwitch = [[UISwitch alloc]init];
        [_accessorySwitch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    }
    return _accessorySwitch;
}

- (UILabel *)accessoryLabel {
    if (_accessoryLabel == nil) {
        _accessoryLabel = [[UILabel alloc]init];
        _accessoryLabel.textColor = [UIColor grayColor];
    }
    return _accessoryLabel;
}

- (void)switchChange {
    // 保存数据
//    NSLog(@"开关发生改变");
    CZItemSwitch *item = (CZItemSwitch *)self.item;
    
    item.on = self.accessorySwitch.isOn;
    
    
}

// show = YES就代表显示
- (void)showLine:(BOOL)show {
    
    self.line.hidden = !show;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.line.x = self.textLabel.x;
    self.line.width = self.width;
    self.line.y = self.height - 1;
    self.line.height = 1;
}
@end
