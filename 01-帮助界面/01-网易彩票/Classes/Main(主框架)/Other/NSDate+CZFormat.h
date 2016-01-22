//
//  NSDate+CZFormat.h
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CZFormat)
- (NSString *)stringWithFormat:(NSString *)format;
+ (instancetype)dateWithString:(NSString *)dateStr format:(NSString *)format;
@end
