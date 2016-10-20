//
//  StudyModel.m
//  Data
//
//  Created by Aisino on 16/7/19.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "StudyModel.h"
#import "NSDate+Custom.h"
#import "NSCalendar+CustonTime.h"
@implementation StudyModel
static NSDateFormatter *fmt_;
static  NSCalendar *canlendar_;
+(void)initialize{
    fmt_ = [[NSDateFormatter alloc]init];
    canlendar_ = [NSCalendar calender];
    
}

-(NSString*)add_time{
     fmt_.dateFormat = @"yyyy-MM-dd HH:mm:ss";
     NSDate *createDate = [fmt_ dateFromString:_add_time];
    if (createDate.isThisYear) {
        if (createDate.isThisDay) {
            
            NSDate *date = [NSDate date];
            NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;;
            NSDateComponents *cmps = [canlendar_ components:unit fromDate:createDate toDate:date options:NSCalendarWrapComponents];
            if (cmps.hour >= 1) {
                
                return [NSString stringWithFormat:@"%ld小时前",(long)cmps.hour];
                
            }else if (cmps.minute >= 1){
                
                 return [NSString stringWithFormat:@"%ld分钟前",(long)cmps.minute];
                
            }else{
                
                return  @"刚刚";
            }
        }else if(createDate.isThisYesterday){
            
            fmt_.dateFormat = @"昨天HH:mm";
            return [fmt_ stringFromDate:createDate];
            
        }else{
            
            fmt_.dateFormat = @"MM-dd HH:mm";
            return [fmt_ stringFromDate:createDate];
            
        }
    }else{
        
        return _add_time;
        
    }
    
}

-(CGFloat)cellHeight{
    
    if(_cellHeight ) return _cellHeight;
    //内容
    _cellHeight = 23;
    //计算后的高度
    
    if (self.img.count == 3) {
        CGFloat width = (kWidth - 4*kOFF) /3.0;
        CGFloat height = (width*120.0) / 160;
        self.contentFrame = CGRectMake(0, 23+5, kWidth, height);
        _cellHeight = _cellHeight + height + 10 + 25;
        
    }else{
        
        _cellHeight = 80;
    
    }
    
    return _cellHeight;
}
@end
