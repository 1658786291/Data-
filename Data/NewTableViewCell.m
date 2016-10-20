//
//  NewTableViewCell.m
//  Data
//
//  Created by Aisino on 16/7/20.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "NewTableViewCell.h"

@implementation NewTableViewCell

-(void)setDataArray:(NSMutableArray *)dataArray{
    
    _dataArray = dataArray;
    for (UIView *view in self.contentView.subviews) {
        
        [view removeFromSuperview];
    }
    CGFloat width = (kWidth - 4*kOFF) /3.0;
    for (int i = 0; i < dataArray.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(kOFF+(kOFF+width)*i, 5, width, width);
        NewModel *model = self.dataArray[i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        [self addSubview:imageView];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kOFF+(kOFF+width)*i, imageView.bottom + 5, width, 20)];
        label.textAlignment =NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.text = model.name;
        [self.contentView addSubview:label];
      
        
    }
    
  
    
}


@end
