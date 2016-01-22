//
//  CZTool.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "CZTool.h"

@implementation CZTool

+ (instancetype)tool {
//    NSStringFromClass(self)
    return [[[NSBundle mainBundle]loadNibNamed:@"CZTool" owner:nil options:nil] lastObject];
}

- (IBAction)clickSure:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toolDidClickSure:)]) {
        [self.delegate toolDidClickSure:self];
    }
    
}

- (IBAction)clickCancel:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toolDidClickCancel:)]) {
        [self.delegate toolDidClickCancel:self];
    }
}

@end
