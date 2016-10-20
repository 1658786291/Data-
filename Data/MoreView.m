//
//  MoreView.m
//  Data
//
//  Created by Aisino on 16/7/19.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "MoreView.h"

@implementation MoreView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
    }
    return self;
    
    
}


-(void)setModel:(StudyModel *)model{
    
    _model = model;
    if (model.img.count == 1) {
        
    }else{
        
        CGFloat width = (kWidth - 4*kOFF) /3.0;
       
        CGFloat height = (width*120.0) / 160;
        self.imageHeight = height;
        for (int i = 0; i < model.img.count; i++) {
            
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.frame = CGRectMake(kOFF+(kOFF+width)*i, 0, width, height);
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.img[i]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
            [self addSubview:imageView];
            
        }
        
    }
    
    
}

@end
