

//
//  JSButton.m
//  Data
//
//  Created by Aisino on 16/7/18.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "JSButton.h"

@implementation JSButton

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        // self.selected = YES;
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
    }
    return  self;
    
    
}

@end
