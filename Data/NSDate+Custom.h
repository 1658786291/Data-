//
//  NSDate+Custom.h
//  Data
//
//  Created by Aisino on 16/7/19.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Custom)
/**是否今年*/
-(BOOL) isThisYear;
/**是否今天*/
-(BOOL)isThisDay;
/**是否昨天*/
-(BOOL)isThisYesterday;
/**是否明天*/
-(BOOL)isThmorrow;
@end
