
//
//  NSDate+Custom.m
//  Data
//
//  Created by Aisino on 16/7/19.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "NSDate+Custom.h"
#import "NSCalendar+CustonTime.h"
@implementation NSDate (Custom)
#pragma  mark 今年
-(BOOL)isThisYear{
    
    NSCalendar *calendar = [NSCalendar calender];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate: self];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    if (selfYear == nowYear)  return YES;
    return NO;
}

#pragma  mark 今天
-(BOOL)isThisDay{
    
    NSCalendar *calendar = [NSCalendar calender];
    NSDateComponents *selfDay = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate: self];
    NSDateComponents *nowDay = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    if(selfDay.year == nowDay.year && selfDay.month ==  nowDay.month && selfDay.day == nowDay.day) return YES;
    return NO;
    
}

#pragma  mark 昨天
-(BOOL)isThisYesterday{
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyyMMdd";
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    NSCalendar *calendar = [NSCalendar calender];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComponents = [calendar components:unit fromDate:selfDate toDate:nowDate options:NSCalendarWrapComponents];
    if(dateComponents.year == 0 && dateComponents.month == 0 && dateComponents.day == 1)
        return YES;
    return NO;
    
}
#pragma  mark 明天
-(BOOL)isThmorrow{
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyyMMdd";
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    NSCalendar *calendar = [NSCalendar calender];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComponents = [calendar components:unit fromDate:selfDate toDate:nowDate options:NSCalendarWrapComponents];
    if(dateComponents.year == 0 && dateComponents.month == 0 && dateComponents.day == -1)
        return YES;
    return NO;
    
}
@end
