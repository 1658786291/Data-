



//
//  DetaiTableViewCell.m
//  Data
//
//  Created by Aisino on 16/7/25.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "DetaiTableViewCell.h"

@implementation DetaiTableViewCell

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.textLabel.x = 0;
    self.textLabel.y = 0;
    self.textLabel.width = kWidth;
    self.textLabel.height = self.contentView.height;
}
-(void)setDict:(NSDictionary *)dict{
    
        
        self.textLabel.text = dict[@"text"];
    
   
    
}
@end
