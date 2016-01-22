//
//  NSDate+CZFormat.m
//  01-网易彩票
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "NSDate+CZFormat.h"

@implementation NSDate (CZFormat)
- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

+ (instancetype)dateWithString:(NSString *)dateStr format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = format;
    return [formatter dateFromString:dateStr];
}
@end
