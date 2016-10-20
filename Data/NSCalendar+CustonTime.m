
//
//  NSCalendar+CustonTime.m
//  
//
//  Created by Aisino on 16/7/19.
//
//

#import "NSCalendar+CustonTime.h"

@implementation NSCalendar (CustonTime)

+(instancetype)calender{
    
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];//阳历
    } else {
        return [NSCalendar currentCalendar];//获取当前的时间
    }
  
}

@end
