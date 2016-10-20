//
//  DetailTableViewCell.m
//  Data
//
//  Created by Aisino on 16/7/25.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

-(void)layoutSubviews{
 
    [super layoutSubviews];
    
    if (self.dict[@"img"][@"source"]) {
        
        self.imageView.x = 10;
        self.imageView.y = 0;
        self.imageView.width = kWidth-20;
        self.imageView.height = self.contentView.height-10;
    }else{
        
        self.textLabel.x = 10;
        self.textLabel.y = 0;
        self.textLabel.width = kWidth-20;
        self.textLabel.height = self.contentView.height;
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.numberOfLines = 0;
    }
    
        
   
    
}


-(void)setDict:(NSDictionary *)dict{
    
    _dict = dict;
    self.textLabel.text = @"";
    self.imageView.image = nil;
    [self layoutSubviews];
    if (self.textLabel.width == kWidth-20) {
        
        self.textLabel.text = dict[@"text"];
        
    }else{
        
         [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dict[@"img"][@"source"]]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
//        NSLog(@"====%@",dict[@"img"][@"source"]);
    }
 
    


    
}

@end
