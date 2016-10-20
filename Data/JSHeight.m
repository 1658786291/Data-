//
//  JSHeight.m
//  Data
//
//  Created by Aisino on 16/7/25.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "JSHeight.h"

@implementation JSHeight

+(CGFloat)sizeHeight:(NSString *)text WithFont:(CGFloat)fontSize{
    
    CGSize size = [text boundingRectWithSize:CGSizeMake( kWidth-20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size;
    return size.height;
    
}

@end
