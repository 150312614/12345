//
//  CZSettingCell.h
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZItem;
@interface CZSettingCell : UITableViewCell
+ (instancetype)settingCellWithTableView:(UITableView *)tableView;
+ (instancetype)settingCellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;
@property (nonatomic,strong) CZItem *item;

///  是否需要显示分隔线
///
///  @param show 
- (void)showLine:(BOOL)show;
@end
