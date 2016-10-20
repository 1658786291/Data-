//
//  ImageTableViewCell.m
//  Data
//
//  Created by Aisino on 16/7/21.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "ImageTableViewCell.h"


@implementation ImageTableViewCell


- (void)awakeFromNib {
    
   
    
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.imageView.x = 0;
    self.imageView.y = 5;
    self.imageView.width = kWidth;
    self.imageView.height = self.height;
    
    
    
}
@end
