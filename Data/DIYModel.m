
//
//  DIYModel.m
//  Data
//
//  Created by Aisino on 16/7/19.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "DIYModel.h"

@implementation DIYModel

-(CGFloat)cellHeight{
    
    if(_cellHeight) return _cellHeight;
    CGFloat height = kWidth *266.0 / 400.0;
    _cellHeight = height + 40.0;
    return _cellHeight ;
}

@end
