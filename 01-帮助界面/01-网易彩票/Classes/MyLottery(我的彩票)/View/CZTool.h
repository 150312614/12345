//
//  CZTool.h
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZTool;
@protocol CZToolDelegate <NSObject>

@optional
///   点击工具条的确定
///
///  @param tool
- (void)toolDidClickSure:(CZTool *)tool;

///  点击工具条的取消
///
///  @param tool
- (void)toolDidClickCancel:(CZTool *)tool;


@end

@interface CZTool : UIView

+ (instancetype)tool;
@property(nonatomic,weak)id<CZToolDelegate> delegate;

@end
